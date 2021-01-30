import COVID19Py
covid19 = COVID19Py.COVID19()

covid19 = COVID19Py.COVID19(data_source="csbs")

latest = covid19.getLatest()

cases = latest['confirmed']

print(cases)

