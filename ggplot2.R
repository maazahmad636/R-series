#ggplot2----

#`ggplot2`, like `dplyr`, is also one of the core packages of the tidyverse. It is useful for creating complex and aesthetically pleasing visualizations.

library(tidyverse)

## sactter plot----
ggplot(data = ChickWeight, #data
       aes(x = Time, y = weight)) + geom_point() #geometry

ggplot(data = ChickWeight, aes(x = Time, y = weight, color = Diet)) + 
  geom_point(size = 3) + 
  labs(title = "Chick Weight Gain over Time by Diet", x = "Time", y = "Weight")

data("mtcars")
ggplot(data = mtcars,aes(x=cyl,y=carb, colour = gear))+
  geom_point()+
  labs(tittle="no. of carb over cyl by gear",x="Cyl",y="Carb")

# Using ggplot2
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "#33ff6b", size = 2) +
  labs(title = "MPG vs Car Weight",
       x = "Weight",
       y = "Miles per Gallon") +
  theme_test()



data("ChickWeight")

##Box plot----

library(ggplot2)

ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot()

library(ggplot2)

ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "skyblue") +
  geom_jitter(width = 0.2,color="orange",alpha=05)
  labs(title = "MPG by Cylinder Count",
       x = "Cylinders",
       y = "Miles per Gallon") +
  theme_bw()

##facet----
ggplot(data = ChickWeight, aes(x = Time, y = weight)) +
    geom_point() +
    facet_grid(. ~ Diet)
ggplot(data = ChickWeight, aes(x = Time, y = weight)) +
    geom_point() +
    facet_grid(Diet ~ .)


data("Indometh")

ggplot(data = Indometh, aes(x=time, y=conc))+
  geom_point()

ggplot(data = Indometh, aes(x = time, y = conc, color=Subject)) +
  geom_point() +
  facet_grid(Subject ~ .)

ggplot(data = Indometh, aes(x = time, y = conc, color=Subject)) +
  geom_point() +
  facet_grid(.~Subject)

#  Make a scatterplot that visualizes the relationship between `time` and `conc`.
?ggplot
ggplot(Indometh,aes(x=time,y=conc,))+
  geom_point(colour="green",size=2,alpha=0.5)+labs(tittle="distribution of concentration over time",
                                                   x="Time",
                                                   y="concentration")+
  theme_get()

#Make a boxplot that visualizes the `conc` distribution for each `Subject`.

ggplot(Indometh,aes(x=time,y=conc,))+
  geom_boxplot(fill="green",size=1)+
  facet_grid(.~Subject)

# Create the boxplot
ggplot(Indometh, aes(x = factor(Subject), y = conc)) +
  geom_boxplot(fill = "lightgreen", outlier.shape = NA) +
  geom_jitter(width = 0.2, color = "darkgreen", alpha = 0.6) +
  labs(title = "Concentration Distribution by Subject",
       x = "Subject",
       y = "Drug Concentration (conc)") +
  theme_minimal()

#Make a plot with facets that visualizes the relationship between `time` and `conc` for each `Subject`.

ggplot(Indometh, aes(x = time, y = conc)) +
  geom_point(color = "blue", size = 2) +       # Points
  geom_line(color = "darkblue") +              # Lines connecting points
  facet_wrap(~ Subject) +                      # Facet by Subject
  labs(title = "Time vs Concentration for Each Subject",
       x = "Time",
       y = "Drug Concentration (conc)") +
  theme_minimal()

data("Theoph")
print(Theoph)
str(Theoph)
#Make a scatterplot that visualizes the relationship between `Time` and `conc`.

ggplot(Theoph,aes(x=Time,y=conc))+geom_point(color="orange",size=2)+
  geom_line(color="orange")


ggplot(Theoph, aes(x = Time, y = conc)) +
  geom_point(color = "purple", size = 2) +
  labs(title = "Theophylline Concentration Over Time",
       x = "Time (hr)",
       y = "Concentration (mg/L)") +
  theme_minimal()

#Make a boxplot that visualizes the `conc` distribution for each `Dose`. If `Dose` is not yet a factor, you will have to use `factor(Dose)`.

  
ggplot(Theoph, aes(x = factor(Dose), y = conc)) +
    geom_boxplot(fill = "skyblue") +
    geom_jitter(width = 0.2, color = "darkblue", alpha = 0.6)+
    labs(title = "Distribution of Theophylline Concentration by Dose",
         x = "Dose (grouped as factor)",
         y = "Concentration (mg/L)") +
    theme_minimal()
#Make a boxplot that visualizes the `conc` distribution for each `Subject`. If `Subject` is not yet a factor, you will have to use `factor(Subject)`.
ggplot(Theoph,aes(x=factor(Subject),y=conc))+
  geom_boxplot(fill="pink")+
  geom_jitter(width=1,color="orange")+
  labs(title = "Distribution of Theophylline Concentration by Dose",
                                   x = "Subject (grouped as factor)",
                                   y = "Concentration (mg/L)") +
  theme_minimal()

ggplot(Theoph, aes(x = Time, y = conc)) +
  geom_point(color = "darkorange", size = 2) +
  geom_line(aes(group = Subject), color = "gray40") +
  facet_wrap(Dose ~ Subject) +  # Facet by Dose (rows) and Subject (columns)
  labs(title = "Theophylline Concentration Over Time",
       subtitle = "Faceted by Subject and Dose",
       x = "Time (hr)",
       y = "Concentration (mg/L)") +
  theme_bw()


Theoph$Sub_Dose <- paste("Subject", Theoph$Subject, "\nDose", Theoph$Dose)

# Enhanced plot
ggplot(Theoph, aes(x = Time, y = conc, color = factor(Dose))) +
  geom_point(size = 2) +
  geom_smooth(method = "loess", se = FALSE, linewidth = 1.2) +
  facet_wrap(~ Sub_Dose, ncol = 4) +
  labs(title = "Theophylline Concentration Over Time",
       subtitle = "Each panel shows one Subject-Dose combination",
       x = "Time (hr)",
       y = "Concentration (mg/L)",
       color = "Dose (mg)") +
  theme_minimal(base_size = 12) +
  theme(strip.text = element_text(face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))  


library(tidyverse)

data("esoph")
tibble(esoph)

age_summary <- esoph %>%
  group_by(agegp) %>%  summarise(total_cases = sum(ncases))

ggplot(age_summary, aes(x = agegp, y = total_cases)) +
  geom_bar(stat = "identity", fill = "lightgreen") +
  labs(title = "Esophageal Cancer Cases by Age Group",
       x = "Age Group",
       y = "Total Number of Cases") +
  theme_minimal()

alcgp_summary<- esoph %>% 
  mutate(alcgp = factor(gsub("g/day", "", as.character(alcgp))))

tibble(alcgp_summary)


esoph_mutated <- esoph %>%
  mutate(npeople = ncases + ncontrols) %>%
  mutate(esoph_freq = ncases / npeople)

ggplot(data = esoph_mutated, aes(x = agegp, y = esoph_freq)) +
  geom_boxplot() +
  geom_jitter(color = "orange", alpha = 0.5)


ggplot(data = esoph_mutated, aes(x = alcgp, y = esoph_freq)) +
  geom_boxplot(fill="lightblue") +
  geom_jitter(color = "orange", alpha = 0.5)

ggplot(data = esoph_mutated, aes(x = tobgp, y = esoph_freq)) +
  geom_boxplot(fill="lightgreen") +
  geom_jitter(color = "orange", alpha = 0.5)         

ggplot(data = esoph_mutated, aes(x = agegp, y = esoph_freq)) +
  geom_point(color="purple") +
  facet_grid(tobgp ~ alcgp)
