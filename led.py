# Simple test for NeoPixels on Raspberry Pi
import time
import board
import neopixel
import COVID19Py

time.sleep(20)

covid19 = COVID19Py.COVID19()
latest = covid19.getLatest()

cases = latest['confirmed']
print(cases)

# Choose an open pin connected to the Data In of the NeoPixel strip, i.e. board.D18
# NeoPixels must be connected to D10, D12, D18 or D21 to work.
pixel_pin = board.D21

# The number of NeoPixels
num_pixels = 8

# The order of the pixel colors - RGB or GRB. Some NeoPixels have red and green reversed!
# For RGBW NeoPixels, simply change the ORDER to RGBW or GRBW.
ORDER = neopixel.GRB

pixels = neopixel.NeoPixel(
    pixel_pin, num_pixels, brightness=0.2, auto_write=False, pixel_order=ORDER
)

digits= []
cases_by_million = int(cases/1000000)
print(cases_by_million)

while(cases_by_million>0):
    d = cases_by_million%2
    digits.append(d)
    cases_by_million=cases_by_million//2
digits.reverse()
print(digits)

while True:
    # Comment this line out if you have RGBW/GRBW NeoPixels
    pixels.fill((0,0,0))
    pixels.show()
    time.sleep(1)
    for i in range(len(digits)):
        if digits[i] ==1:
            pixels[i] = (255,0,0)
    pixels.show()
    time.sleep(1)

