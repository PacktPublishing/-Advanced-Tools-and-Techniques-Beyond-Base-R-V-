# Libraries
library(tidyverse)
library(tweenr)
library(gganimate)
library(forcats)

tweened <- read_tsv("drug_trial.tsv") %>%
  select(sex, pill, starting_weight, final_weight) %>%
  gather(timepoint, weight, 3:4) %>%
  mutate(sex = factor(sex)) %>%
  mutate(pill = factor(pill)) %>%
  mutate(timepoint = fct_rev(timepoint)) %>%
  split(.$timepoint)  %>%
  tween_states(tweenlength = 5, statelength = 10, ease = 'cubic-in-out',
               nframes = 25) %>%
  mutate(state = "...") %>%
  mutate(state = ifelse(.frame <= 10, "Starting weight", state)) %>%
  mutate(state = ifelse(.frame >= 16, "Final weight", state)) %>%
  mutate(.frame = factor(.frame))

p <- ggplot(tweened, aes(x = weight, fill = pill, frame = .frame, label = state)) +
  geom_density(alpha = 0.5) +
  geom_label(x = 75, y = 0.045, show.legend = F) +
  facet_wrap(~ sex)

gganimate(p, interval = 0.1, title_frame = F)
