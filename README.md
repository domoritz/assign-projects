# Project assignment

Simple [Answer Set Programming](https://en.wikipedia.org/wiki/Answer_set_programming) program that that calculates the optimal assignment of students to projects after the students provided a list of ranked choices.

# Requirements

_gringo_ and _clasp_ from [Potassco](http://potassco.sourceforge.net/).

# Speed

We used the program to calculate the assignment of 80 students to 13 projects. Each student has 5 choices.

# How to use it

## Create a `projects.lp` and `students.lp` file

These files should contain data about which projects students chose and what projects are available.

The `students.lp` file should contain `select` entries of the following form.

```prolog
select(S,P,N).
```

<dl>
  <dt>S</dt>
  <dd>Number representing a student</dd>

  <dt>P</dt>
  <dd>Number representing a project</dd>
  
  <dt>N</dt>
  <dd>Ranking of this choice</dd>
</dl>

Also create the `projects.lp` file that contains the available projects in the following form.

```prolog
project(P,MIN,MAX).
```

<dl>
  <dt>MIN and MAX</dt>
  <dd>Minimum and maximum number of students per project</dd>
</dl>

## Run the program

```bash
gringo penalty.lp students.lp projects.lp encoding.lp | clasp
```

# Attribution

Thanks to [Martin](http://www.cs.uni-potsdam.de/~gebser/) for his help with speeding up computation significantly.