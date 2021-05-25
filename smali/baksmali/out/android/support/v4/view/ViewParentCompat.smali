.class public final Landroid/support/v4/view/ViewParentCompat;
.super Ljava/lang/Object;
.source "ViewParentCompat.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ViewParentCompat"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static notifySubtreeAccessibilityStateChanged(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V
    .registers 6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_9

    invoke-interface {p0, p1, p2, p3}, Landroid/view/ViewParent;->notifySubtreeAccessibilityStateChanged(Landroid/view/View;Landroid/view/View;I)V

    :cond_9
    return-void
.end method

.method public static onNestedFling(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z
    .registers 7

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2d

    :try_start_6
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/view/ViewParent;->onNestedFling(Landroid/view/View;FFZ)Z

    move-result p1
    :try_end_a
    .catch Ljava/lang/AbstractMethodError; {:try_start_6 .. :try_end_a} :catch_b

    return p1

    :catch_b
    move-exception p1

    const-string p2, "ViewParentCompat"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "ViewParent "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " does not implement interface "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "method onNestedFling"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_38

    :cond_2d
    instance-of v0, p0, Landroid/support/v4/view/NestedScrollingParent;

    if-eqz v0, :cond_38

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent;

    invoke-interface {p0, p1, p2, p3, p4}, Landroid/support/v4/view/NestedScrollingParent;->onNestedFling(Landroid/view/View;FFZ)Z

    move-result p0

    return p0

    :cond_38
    :goto_38
    const/4 p0, 0x0

    return p0
.end method

.method public static onNestedPreFling(Landroid/view/ViewParent;Landroid/view/View;FF)Z
    .registers 6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2d

    :try_start_6
    invoke-interface {p0, p1, p2, p3}, Landroid/view/ViewParent;->onNestedPreFling(Landroid/view/View;FF)Z

    move-result p1
    :try_end_a
    .catch Ljava/lang/AbstractMethodError; {:try_start_6 .. :try_end_a} :catch_b

    return p1

    :catch_b
    move-exception p1

    const-string p2, "ViewParentCompat"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "ViewParent "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " does not implement interface "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "method onNestedPreFling"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_38

    :cond_2d
    instance-of v0, p0, Landroid/support/v4/view/NestedScrollingParent;

    if-eqz v0, :cond_38

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent;

    invoke-interface {p0, p1, p2, p3}, Landroid/support/v4/view/NestedScrollingParent;->onNestedPreFling(Landroid/view/View;FF)Z

    move-result p0

    return p0

    :cond_38
    :goto_38
    const/4 p0, 0x0

    return p0
.end method

.method public static onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[I)V
    .registers 11

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Landroid/support/v4/view/ViewParentCompat;->onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[II)V

    return-void
.end method

.method public static onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[II)V
    .registers 13

    instance-of v0, p0, Landroid/support/v4/view/NestedScrollingParent2;

    if-eqz v0, :cond_10

    move-object v1, p0

    check-cast v1, Landroid/support/v4/view/NestedScrollingParent2;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-interface/range {v1 .. v6}, Landroid/support/v4/view/NestedScrollingParent2;->onNestedPreScroll(Landroid/view/View;II[II)V

    goto :goto_47

    :cond_10
    if-nez p5, :cond_47

    sget p5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p5, v0, :cond_3e

    :try_start_18
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/view/ViewParent;->onNestedPreScroll(Landroid/view/View;II[I)V
    :try_end_1b
    .catch Ljava/lang/AbstractMethodError; {:try_start_18 .. :try_end_1b} :catch_1c

    goto :goto_47

    :catch_1c
    move-exception p1

    const-string p2, "ViewParentCompat"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "ViewParent "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " does not implement interface "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "method onNestedPreScroll"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_47

    :cond_3e
    instance-of p5, p0, Landroid/support/v4/view/NestedScrollingParent;

    if-eqz p5, :cond_47

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent;

    invoke-interface {p0, p1, p2, p3, p4}, Landroid/support/v4/view/NestedScrollingParent;->onNestedPreScroll(Landroid/view/View;II[I)V

    :cond_47
    :goto_47
    return-void
.end method

.method public static onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIII)V
    .registers 13

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v6}, Landroid/support/v4/view/ViewParentCompat;->onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIIII)V

    return-void
.end method

.method public static onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIIII)V
    .registers 15

    instance-of v0, p0, Landroid/support/v4/view/NestedScrollingParent2;

    if-eqz v0, :cond_11

    move-object v1, p0

    check-cast v1, Landroid/support/v4/view/NestedScrollingParent2;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-interface/range {v1 .. v7}, Landroid/support/v4/view/NestedScrollingParent2;->onNestedScroll(Landroid/view/View;IIIII)V

    goto :goto_4e

    :cond_11
    if-nez p6, :cond_4e

    sget p6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p6, v0, :cond_3f

    :try_start_19
    invoke-interface/range {p0 .. p5}, Landroid/view/ViewParent;->onNestedScroll(Landroid/view/View;IIII)V
    :try_end_1c
    .catch Ljava/lang/AbstractMethodError; {:try_start_19 .. :try_end_1c} :catch_1d

    goto :goto_4e

    :catch_1d
    move-exception p1

    const-string p2, "ViewParentCompat"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "ViewParent "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " does not implement interface "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "method onNestedScroll"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4e

    :cond_3f
    instance-of p6, p0, Landroid/support/v4/view/NestedScrollingParent;

    if-eqz p6, :cond_4e

    move-object v0, p0

    check-cast v0, Landroid/support/v4/view/NestedScrollingParent;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/view/NestedScrollingParent;->onNestedScroll(Landroid/view/View;IIII)V

    :cond_4e
    :goto_4e
    return-void
.end method

.method public static onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Landroid/support/v4/view/ViewParentCompat;->onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method public static onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)V
    .registers 6

    instance-of v0, p0, Landroid/support/v4/view/NestedScrollingParent2;

    if-eqz v0, :cond_a

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent2;

    invoke-interface {p0, p1, p2, p3, p4}, Landroid/support/v4/view/NestedScrollingParent2;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;II)V

    goto :goto_41

    :cond_a
    if-nez p4, :cond_41

    sget p4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p4, v0, :cond_38

    :try_start_12
    invoke-interface {p0, p1, p2, p3}, Landroid/view/ViewParent;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    :try_end_15
    .catch Ljava/lang/AbstractMethodError; {:try_start_12 .. :try_end_15} :catch_16

    goto :goto_41

    :catch_16
    move-exception p1

    const-string p2, "ViewParentCompat"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "ViewParent "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " does not implement interface "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "method onNestedScrollAccepted"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_41

    :cond_38
    instance-of p4, p0, Landroid/support/v4/view/NestedScrollingParent;

    if-eqz p4, :cond_41

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent;

    invoke-interface {p0, p1, p2, p3}, Landroid/support/v4/view/NestedScrollingParent;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V

    :cond_41
    :goto_41
    return-void
.end method

.method public static onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z
    .registers 5

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Landroid/support/v4/view/ViewParentCompat;->onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)Z

    move-result p0

    return p0
.end method

.method public static onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)Z
    .registers 6

    instance-of v0, p0, Landroid/support/v4/view/NestedScrollingParent2;

    if-eqz v0, :cond_b

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent2;

    invoke-interface {p0, p1, p2, p3, p4}, Landroid/support/v4/view/NestedScrollingParent2;->onStartNestedScroll(Landroid/view/View;Landroid/view/View;II)Z

    move-result p0

    return p0

    :cond_b
    if-nez p4, :cond_45

    sget p4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p4, v0, :cond_3a

    :try_start_13
    invoke-interface {p0, p1, p2, p3}, Landroid/view/ViewParent;->onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z

    move-result p1
    :try_end_17
    .catch Ljava/lang/AbstractMethodError; {:try_start_13 .. :try_end_17} :catch_18

    return p1

    :catch_18
    move-exception p1

    const-string p2, "ViewParentCompat"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "ViewParent "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " does not implement interface "

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "method onStartNestedScroll"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_45

    :cond_3a
    instance-of p4, p0, Landroid/support/v4/view/NestedScrollingParent;

    if-eqz p4, :cond_45

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent;

    invoke-interface {p0, p1, p2, p3}, Landroid/support/v4/view/NestedScrollingParent;->onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z

    move-result p0

    return p0

    :cond_45
    :goto_45
    const/4 p0, 0x0

    return p0
.end method

.method public static onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;)V
    .registers 3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/support/v4/view/ViewParentCompat;->onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;I)V

    return-void
.end method

.method public static onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;I)V
    .registers 5

    instance-of v0, p0, Landroid/support/v4/view/NestedScrollingParent2;

    if-eqz v0, :cond_a

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent2;

    invoke-interface {p0, p1, p2}, Landroid/support/v4/view/NestedScrollingParent2;->onStopNestedScroll(Landroid/view/View;I)V

    goto :goto_41

    :cond_a
    if-nez p2, :cond_41

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p2, v0, :cond_38

    :try_start_12
    invoke-interface {p0, p1}, Landroid/view/ViewParent;->onStopNestedScroll(Landroid/view/View;)V
    :try_end_15
    .catch Ljava/lang/AbstractMethodError; {:try_start_12 .. :try_end_15} :catch_16

    goto :goto_41

    :catch_16
    move-exception p1

    const-string p2, "ViewParentCompat"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ViewParent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " does not implement interface "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "method onStopNestedScroll"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p2, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_41

    :cond_38
    instance-of p2, p0, Landroid/support/v4/view/NestedScrollingParent;

    if-eqz p2, :cond_41

    check-cast p0, Landroid/support/v4/view/NestedScrollingParent;

    invoke-interface {p0, p1}, Landroid/support/v4/view/NestedScrollingParent;->onStopNestedScroll(Landroid/view/View;)V

    :cond_41
    :goto_41
    return-void
.end method

.method public static requestSendAccessibilityEvent(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-interface {p0, p1, p2}, Landroid/view/ViewParent;->requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p0

    return p0
.end method
