# imageprocessingexperiment
Develop a grayscale filter using Vivado HLS and implement it as an IP core for the PYNQ-Z2 board. Use Python to apply the filter to a sample image, demonstrating real-time image processing and hardware-software integration skills.
from PIL import Image
import numpy as np

# Load image
image = Image.open("sample.jpg").convert("RGB")

# Convert to grayscale
gray_image = image.convert("L")
gray_image.save("grayscale_image.jpg")

print("Grayscale conversion completed.")
