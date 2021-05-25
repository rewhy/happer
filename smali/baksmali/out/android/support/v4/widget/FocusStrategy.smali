.class Landroid/support/v4/widget/FocusStrategy;
.super Ljava/lang/Object;
.source "FocusStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;,
        Landroid/support/v4/widget/FocusStrategy$BoundsAdapter;,
        Landroid/support/v4/widget/FocusStrategy$SequentialComparator;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static beamBeats(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 7
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/FocusStrategy;->beamsOverlap(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0

    invoke-static {p0, p1, p3}, Landroid/support/v4/widget/FocusStrategy;->beamsOverlap(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2d

    if-nez v0, :cond_e

    goto :goto_2d

    :cond_e
    invoke-static {p0, p1, p3}, Landroid/support/v4/widget/FocusStrategy;->isToDirectionOf(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_16

    return v1

    :cond_16
    const/16 v0, 0x11

    if-eq p0, v0, :cond_2c

    const/16 v0, 0x42

    if-ne p0, v0, :cond_1f

    goto :goto_2c

    :cond_1f
    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/FocusStrategy;->majorAxisDistance(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result p2

    invoke-static {p0, p1, p3}, Landroid/support/v4/widget/FocusStrategy;->majorAxisDistanceToFarEdge(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result p0

    if-ge p2, p0, :cond_2a

    goto :goto_2b

    :cond_2a
    const/4 v1, 0x0

    :goto_2b
    return v1

    :cond_2c
    :goto_2c
    return v1

    :cond_2d
    :goto_2d
    return v2
.end method

.method private static beamsOverlap(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 6
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x11

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p0, v0, :cond_2a

    const/16 v0, 0x21

    if-eq p0, v0, :cond_1b

    const/16 v0, 0x42

    if-eq p0, v0, :cond_2a

    const/16 v0, 0x82

    if-ne p0, v0, :cond_13

    goto :goto_1b

    :cond_13
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1b
    :goto_1b
    iget p0, p2, Landroid/graphics/Rect;->right:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    if-lt p0, v0, :cond_28

    iget p0, p2, Landroid/graphics/Rect;->left:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    if-gt p0, p1, :cond_28

    goto :goto_29

    :cond_28
    const/4 v1, 0x0

    :goto_29
    return v1

    :cond_2a
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    if-lt p0, v0, :cond_37

    iget p0, p2, Landroid/graphics/Rect;->top:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    if-gt p0, p1, :cond_37

    goto :goto_38

    :cond_37
    const/4 v1, 0x0

    :goto_38
    return v1
.end method

.method public static findNextFocusInAbsoluteDirection(Ljava/lang/Object;Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;Landroid/support/v4/widget/FocusStrategy$BoundsAdapter;Ljava/lang/Object;Landroid/graphics/Rect;I)Ljava/lang/Object;
    .registers 13
    .param p0    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/widget/FocusStrategy$BoundsAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(T",
            "L;",
            "Landroid/support/v4/widget/FocusStrategy$CollectionAdapter<",
            "T",
            "L;",
            "TT;>;",
            "Landroid/support/v4/widget/FocusStrategy$BoundsAdapter<",
            "TT;>;TT;",
            "Landroid/graphics/Rect;",
            "I)TT;"
        }
    .end annotation

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    const/16 v1, 0x11

    const/4 v2, 0x0

    if-eq p5, v1, :cond_3e

    const/16 v1, 0x21

    if-eq p5, v1, :cond_34

    const/16 v1, 0x42

    if-eq p5, v1, :cond_29

    const/16 v1, 0x82

    if-ne p5, v1, :cond_21

    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    neg-int v1, v1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_47

    :cond_21
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_29
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    neg-int v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_47

    :cond_34
    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_47

    :cond_3e
    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->offset(II)V

    :goto_47
    const/4 v1, 0x0

    invoke-interface {p1, p0}, Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;->size(Ljava/lang/Object;)I

    move-result v3

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    :goto_51
    if-ge v2, v3, :cond_6a

    invoke-interface {p1, p0, v2}, Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, p3, :cond_5a

    goto :goto_67

    :cond_5a
    invoke-interface {p2, v5, v4}, Landroid/support/v4/widget/FocusStrategy$BoundsAdapter;->obtainBounds(Ljava/lang/Object;Landroid/graphics/Rect;)V

    invoke-static {p5, p4, v4, v0}, Landroid/support/v4/widget/FocusStrategy;->isBetterCandidate(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_67

    invoke-virtual {v0, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    move-object v1, v5

    :cond_67
    :goto_67
    add-int/lit8 v2, v2, 0x1

    goto :goto_51

    :cond_6a
    return-object v1
.end method

.method public static findNextFocusInRelativeDirection(Ljava/lang/Object;Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;Landroid/support/v4/widget/FocusStrategy$BoundsAdapter;Ljava/lang/Object;IZZ)Ljava/lang/Object;
    .registers 11
    .param p0    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/widget/FocusStrategy$BoundsAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(T",
            "L;",
            "Landroid/support/v4/widget/FocusStrategy$CollectionAdapter<",
            "T",
            "L;",
            "TT;>;",
            "Landroid/support/v4/widget/FocusStrategy$BoundsAdapter<",
            "TT;>;TT;IZZ)TT;"
        }
    .end annotation

    invoke-interface {p1, p0}, Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;->size(Ljava/lang/Object;)I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v0, :cond_16

    invoke-interface {p1, p0, v2}, Landroid/support/v4/widget/FocusStrategy$CollectionAdapter;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_16
    new-instance p0, Landroid/support/v4/widget/FocusStrategy$SequentialComparator;

    invoke-direct {p0, p5, p2}, Landroid/support/v4/widget/FocusStrategy$SequentialComparator;-><init>(ZLandroid/support/v4/widget/FocusStrategy$BoundsAdapter;)V

    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    packed-switch p4, :pswitch_data_34

    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_FORWARD, FOCUS_BACKWARD}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_29
    invoke-static {p3, v1, p6}, Landroid/support/v4/widget/FocusStrategy;->getNextFocusable(Ljava/lang/Object;Ljava/util/ArrayList;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2e
    invoke-static {p3, v1, p6}, Landroid/support/v4/widget/FocusStrategy;->getPreviousFocusable(Ljava/lang/Object;Ljava/util/ArrayList;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_29
    .end packed-switch
.end method

.method private static getNextFocusable(Ljava/lang/Object;Ljava/util/ArrayList;Z)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/util/ArrayList<",
            "TT;>;Z)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez p0, :cond_8

    const/4 p0, -0x1

    goto :goto_c

    :cond_8
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->lastIndexOf(Ljava/lang/Object;)I

    move-result p0

    :goto_c
    add-int/lit8 p0, p0, 0x1

    if-ge p0, v0, :cond_15

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_15
    if-eqz p2, :cond_1f

    if-lez v0, :cond_1f

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1f
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getPreviousFocusable(Ljava/lang/Object;Ljava/util/ArrayList;Z)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/util/ArrayList<",
            "TT;>;Z)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez p0, :cond_8

    move p0, v0

    goto :goto_c

    :cond_8
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    :goto_c
    add-int/lit8 p0, p0, -0x1

    if-ltz p0, :cond_15

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_15
    if-eqz p2, :cond_20

    if-lez v0, :cond_20

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_20
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getWeightedDistanceFor(II)I
    .registers 3

    mul-int/lit8 v0, p0, 0xd

    mul-int v0, v0, p0

    mul-int p1, p1, p1

    add-int/2addr v0, p1

    return v0
.end method

.method private static isBetterCandidate(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 7
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1, p2, p0}, Landroid/support/v4/widget/FocusStrategy;->isCandidate(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    invoke-static {p1, p3, p0}, Landroid/support/v4/widget/FocusStrategy;->isCandidate(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_10

    return v2

    :cond_10
    invoke-static {p0, p1, p2, p3}, Landroid/support/v4/widget/FocusStrategy;->beamBeats(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_17

    return v2

    :cond_17
    invoke-static {p0, p1, p3, p2}, Landroid/support/v4/widget/FocusStrategy;->beamBeats(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v0

    if-eqz v0, :cond_1e

    return v1

    :cond_1e
    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/FocusStrategy;->majorAxisDistance(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result v0

    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/FocusStrategy;->minorAxisDistance(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result p2

    invoke-static {v0, p2}, Landroid/support/v4/widget/FocusStrategy;->getWeightedDistanceFor(II)I

    move-result p2

    invoke-static {p0, p1, p3}, Landroid/support/v4/widget/FocusStrategy;->majorAxisDistance(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result v0

    invoke-static {p0, p1, p3}, Landroid/support/v4/widget/FocusStrategy;->minorAxisDistance(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result p0

    invoke-static {v0, p0}, Landroid/support/v4/widget/FocusStrategy;->getWeightedDistanceFor(II)I

    move-result p0

    if-ge p2, p0, :cond_39

    const/4 v1, 0x1

    :cond_39
    return v1
.end method

.method private static isCandidate(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z
    .registers 6
    .param p0    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x11

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p2, v0, :cond_59

    const/16 v0, 0x21

    if-eq p2, v0, :cond_44

    const/16 v0, 0x42

    if-eq p2, v0, :cond_2f

    const/16 v0, 0x82

    if-ne p2, v0, :cond_27

    iget p2, p0, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    if-lt p2, v0, :cond_1e

    iget p2, p0, Landroid/graphics/Rect;->bottom:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    if-gt p2, v0, :cond_25

    :cond_1e
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    if-ge p0, p1, :cond_25

    goto :goto_26

    :cond_25
    const/4 v1, 0x0

    :goto_26
    return v1

    :cond_27
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2f
    iget p2, p0, Landroid/graphics/Rect;->left:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    if-lt p2, v0, :cond_3b

    iget p2, p0, Landroid/graphics/Rect;->right:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    if-gt p2, v0, :cond_42

    :cond_3b
    iget p0, p0, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    if-ge p0, p1, :cond_42

    goto :goto_43

    :cond_42
    const/4 v1, 0x0

    :goto_43
    return v1

    :cond_44
    iget p2, p0, Landroid/graphics/Rect;->bottom:I

    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    if-gt p2, v0, :cond_50

    iget p2, p0, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    if-lt p2, v0, :cond_57

    :cond_50
    iget p0, p0, Landroid/graphics/Rect;->top:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    if-le p0, p1, :cond_57

    goto :goto_58

    :cond_57
    const/4 v1, 0x0

    :goto_58
    return v1

    :cond_59
    iget p2, p0, Landroid/graphics/Rect;->right:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    if-gt p2, v0, :cond_65

    iget p2, p0, Landroid/graphics/Rect;->left:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    if-lt p2, v0, :cond_6c

    :cond_65
    iget p0, p0, Landroid/graphics/Rect;->left:I

    iget p1, p1, Landroid/graphics/Rect;->left:I

    if-le p0, p1, :cond_6c

    goto :goto_6d

    :cond_6c
    const/4 v1, 0x0

    :goto_6d
    return v1
.end method

.method private static isToDirectionOf(ILandroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 6
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x11

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p0, v0, :cond_32

    const/16 v0, 0x21

    if-eq p0, v0, :cond_2a

    const/16 v0, 0x42

    if-eq p0, v0, :cond_22

    const/16 v0, 0x82

    if-ne p0, v0, :cond_1a

    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    iget p1, p2, Landroid/graphics/Rect;->top:I

    if-gt p0, p1, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1

    :cond_1a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_22
    iget p0, p1, Landroid/graphics/Rect;->right:I

    iget p1, p2, Landroid/graphics/Rect;->left:I

    if-gt p0, p1, :cond_29

    const/4 v1, 0x1

    :cond_29
    return v1

    :cond_2a
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    if-lt p0, p1, :cond_31

    const/4 v1, 0x1

    :cond_31
    return v1

    :cond_32
    iget p0, p1, Landroid/graphics/Rect;->left:I

    iget p1, p2, Landroid/graphics/Rect;->right:I

    if-lt p0, p1, :cond_39

    const/4 v1, 0x1

    :cond_39
    return v1
.end method

.method private static majorAxisDistance(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I
    .registers 3
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/FocusStrategy;->majorAxisDistanceRaw(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static majorAxisDistanceRaw(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I
    .registers 4
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x11

    if-eq p0, v0, :cond_2a

    const/16 v0, 0x21

    if-eq p0, v0, :cond_24

    const/16 v0, 0x42

    if-eq p0, v0, :cond_1e

    const/16 v0, 0x82

    if-ne p0, v0, :cond_16

    iget p0, p2, Landroid/graphics/Rect;->top:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p0, p1

    return p0

    :cond_16
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1e
    iget p0, p2, Landroid/graphics/Rect;->left:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr p0, p1

    return p0

    :cond_24
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget p1, p2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p0, p1

    return p0

    :cond_2a
    iget p0, p1, Landroid/graphics/Rect;->left:I

    iget p1, p2, Landroid/graphics/Rect;->right:I

    sub-int/2addr p0, p1

    return p0
.end method

.method private static majorAxisDistanceToFarEdge(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I
    .registers 3
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/FocusStrategy;->majorAxisDistanceToFarEdgeRaw(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I

    move-result p0

    const/4 p1, 0x1

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static majorAxisDistanceToFarEdgeRaw(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I
    .registers 4
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x11

    if-eq p0, v0, :cond_2a

    const/16 v0, 0x21

    if-eq p0, v0, :cond_24

    const/16 v0, 0x42

    if-eq p0, v0, :cond_1e

    const/16 v0, 0x82

    if-ne p0, v0, :cond_16

    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p0, p1

    return p0

    :cond_16
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1e
    iget p0, p2, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr p0, p1

    return p0

    :cond_24
    iget p0, p1, Landroid/graphics/Rect;->top:I

    iget p1, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr p0, p1

    return p0

    :cond_2a
    iget p0, p1, Landroid/graphics/Rect;->left:I

    iget p1, p2, Landroid/graphics/Rect;->left:I

    sub-int/2addr p0, p1

    return p0
.end method

.method private static minorAxisDistance(ILandroid/graphics/Rect;Landroid/graphics/Rect;)I
    .registers 4
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0x11

    if-eq p0, v0, :cond_31

    const/16 v0, 0x21

    if-eq p0, v0, :cond_19

    const/16 v0, 0x42

    if-eq p0, v0, :cond_31

    const/16 v0, 0x82

    if-ne p0, v0, :cond_11

    goto :goto_19

    :cond_11
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_19
    :goto_19
    iget p0, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr p0, p1

    iget p1, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p1, p2

    sub-int/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    return p0

    :cond_31
    iget p0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr p0, p1

    iget p1, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p1, p2

    sub-int/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    return p0
.end method
