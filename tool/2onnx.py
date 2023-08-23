import os
from ultralytics import YOLO
import onnx

def convert2onnx(model_name, input_height=640, input_width=640, optimize_cpu=True):
    model = YOLO(f"{model_name}.pt") 
    success = model.export(format="onnx", 
        imgsz=[input_height,input_width], 
        opset=12, 
        simplify=True, 
        optimize=optimize_cpu) 
    print("Convert2Onnx finish!")


pretarin_model_name = "./pretrain_model/yolov8n-seg"
convert2onnx(pretarin_model_name)

pretarin_model_name = "./pretrain_model/yolov8s-seg"
convert2onnx(pretarin_model_name)

