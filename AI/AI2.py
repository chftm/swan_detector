import tensorflow as tf
import numpy as np
from matplotlib import pyplot as plt
from keras import Sequential
from ultralytics import YOLO
import cv2, os
import logging


model_SEG = YOLO("python/model_YOLO.pt")


def YOLO_predict(src):
    output_size = (800, 400)
    image = cv2.resize(cv2.imread(src), output_size)

    results = model_SEG.predict(image)
    predicted_boxes = results[0].boxes.xyxy

    image_bgr = cv2.imread(src, cv2.IMREAD_COLOR)
    results = []
    for box in predicted_boxes:
        results.append(image[int(box[1]) : int(box[3]), int(box[0]) : int(box[2])])
    return results


model = tf.keras.models.Sequential(
    [
        tf.keras.layers.InputLayer(input_shape=(400, 800, 3)),
        tf.keras.layers.Conv2D(
            64, padding="same", activation="relu", kernel_size=(2, 2)
        ),
        tf.keras.layers.MaxPooling2D(),
        tf.keras.layers.Conv2D(
            48, padding="same", activation="relu", kernel_size=(2, 2)
        ),
        tf.keras.layers.MaxPooling2D(),
        tf.keras.layers.Conv2D(
            32, padding="same", activation="relu", kernel_size=(2, 2)
        ),
        tf.keras.layers.MaxPooling2D(),
        tf.keras.layers.Flatten(),
        tf.keras.layers.Dense(64, activation="relu"),
        tf.keras.layers.Dense(3, activation="softmax"),
    ]
)
model.compile(optimizer="adam", loss=tf.keras.losses.categorical_crossentropy)


def PREDICT(path: str) -> dict:
    print("predicting")
    images = YOLO_predict(path)
    print("done images")
    FINAL_model = tf.keras.models.load_model("model.h5")
    print("model loaded")
    res = {"кликун": 0, "малый": 0, "щипун": 0}
    names = ["кликун", "малый", "щипун"]
    for image in images:
        print("processing")
        res[
            names[
                np.argmax(
                    FINAL_model.predict(
                        np.expand_dims(cv2.resize(image, (800, 400)), axis=0)
                    )
                )
            ]
        ] += 1
    return res


if __name__ == "__main__":
    dirs = ["klikun", "maliy", "shipun"]

    c = 0
    for i in range(1, 3001):
        os.system("cls")
        print(f"{c}/3000 :)")
        c += 1
        for dir_index in range(3):
            images = YOLO_predict(f"{dirs[dir_index]}/images/{i}.jpg")
            for img in images:
                image = cv2.resize(img, (800, 400))
                x_data, y_data = [], []
                res = [0, 0, 0]
                res[dir_index] = 1
                x_data.append(image)
                y_data.append(np.array(res))
                print(y_data)
            model.fit(np.array(x_data), np.array(y_data))

    model.save("python/model.h5")

    print(PREDICT("klikun/images/2969.jpg"))
