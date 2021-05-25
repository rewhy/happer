.class public final Landroid/support/v4/widget/PopupWindowCompat;
.super Ljava/lang/Object;
.source "PopupWindowCompat.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PopupWindowCompatApi21"

.field private static sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

.field private static sGetWindowLayoutTypeMethodAttempted:Z

.field private static sOverlapAnchorField:Ljava/lang/reflect/Field;

.field private static sOverlapAnchorFieldAttempted:Z

.field private static sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

.field private static sSetWindowLayoutTypeMethodAttempted:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getOverlapAnchor(Landroid/widget/PopupWindow;)Z
    .registers 5
    .param p0    # Landroid/widget/PopupWindow;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getOverlapAnchor()Z

    move-result p0

    return p0

    :cond_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_49

    sget-boolean v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorFieldAttempted:Z

    if-nez v0, :cond_30

    const/4 v0, 0x1

    :try_start_16
    const-class v1, Landroid/widget/PopupWindow;

    const-string v2, "mOverlapAnchor"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    sget-object v1, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_25
    .catch Ljava/lang/NoSuchFieldException; {:try_start_16 .. :try_end_25} :catch_26

    goto :goto_2e

    :catch_26
    move-exception v1

    const-string v2, "PopupWindowCompatApi21"

    const-string v3, "Could not fetch mOverlapAnchor field from PopupWindow"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2e
    sput-boolean v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorFieldAttempted:Z

    :cond_30
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_49

    :try_start_34
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_40
    .catch Ljava/lang/IllegalAccessException; {:try_start_34 .. :try_end_40} :catch_41

    return p0

    :catch_41
    move-exception p0

    const-string v0, "PopupWindowCompatApi21"

    const-string v1, "Could not get overlap anchor field in PopupWindow"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_49
    const/4 p0, 0x0

    return p0
.end method

.method public static getWindowLayoutType(Landroid/widget/PopupWindow;)I
    .registers 6
    .param p0    # Landroid/widget/PopupWindow;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getWindowLayoutType()I

    move-result p0

    return p0

    :cond_b
    sget-boolean v0, Landroid/support/v4/widget/PopupWindowCompat;->sGetWindowLayoutTypeMethodAttempted:Z

    const/4 v1, 0x0

    if-nez v0, :cond_24

    const/4 v0, 0x1

    :try_start_11
    const-class v2, Landroid/widget/PopupWindow;

    const-string v3, "getWindowLayoutType"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Landroid/support/v4/widget/PopupWindowCompat;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    sget-object v2, Landroid/support/v4/widget/PopupWindowCompat;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_22} :catch_22

    :catch_22
    sput-boolean v0, Landroid/support/v4/widget/PopupWindowCompat;->sGetWindowLayoutTypeMethodAttempted:Z

    :cond_24
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_37

    :try_start_28
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sGetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_36} :catch_37

    return p0

    :catch_37
    :cond_37
    return v1
.end method

.method public static setOverlapAnchor(Landroid/widget/PopupWindow;Z)V
    .registers 6
    .param p0    # Landroid/widget/PopupWindow;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_a

    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setOverlapAnchor(Z)V

    goto :goto_45

    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_45

    sget-boolean v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorFieldAttempted:Z

    if-nez v0, :cond_2f

    const/4 v0, 0x1

    :try_start_15
    const-class v1, Landroid/widget/PopupWindow;

    const-string v2, "mOverlapAnchor"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    sget-object v1, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_24
    .catch Ljava/lang/NoSuchFieldException; {:try_start_15 .. :try_end_24} :catch_25

    goto :goto_2d

    :catch_25
    move-exception v1

    const-string v2, "PopupWindowCompatApi21"

    const-string v3, "Could not fetch mOverlapAnchor field from PopupWindow"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2d
    sput-boolean v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorFieldAttempted:Z

    :cond_2f
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_45

    :try_start_33
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sOverlapAnchorField:Ljava/lang/reflect/Field;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3c
    .catch Ljava/lang/IllegalAccessException; {:try_start_33 .. :try_end_3c} :catch_3d

    goto :goto_45

    :catch_3d
    move-exception p0

    const-string p1, "PopupWindowCompatApi21"

    const-string v0, "Could not set overlap anchor field in PopupWindow"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_45
    :goto_45
    return-void
.end method

.method public static setWindowLayoutType(Landroid/widget/PopupWindow;I)V
    .registers 8
    .param p0    # Landroid/widget/PopupWindow;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_a

    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setWindowLayoutType(I)V

    return-void

    :cond_a
    sget-boolean v0, Landroid/support/v4/widget/PopupWindowCompat;->sSetWindowLayoutTypeMethodAttempted:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_27

    :try_start_10
    const-class v0, Landroid/widget/PopupWindow;

    const-string v3, "setWindowLayoutType"

    new-array v4, v2, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_25} :catch_25

    :catch_25
    sput-boolean v2, Landroid/support/v4/widget/PopupWindowCompat;->sSetWindowLayoutTypeMethodAttempted:Z

    :cond_27
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_38

    :try_start_2b
    sget-object v0, Landroid/support/v4/widget/PopupWindowCompat;->sSetWindowLayoutTypeMethod:Ljava/lang/reflect/Method;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_38} :catch_38

    :catch_38
    :cond_38
    return-void
.end method

.method public static showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;III)V
    .registers 7
    .param p0    # Landroid/widget/PopupWindow;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_a

    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    goto :goto_24

    :cond_a
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    invoke-static {p4, v0}, Landroid/support/v4/view/GravityCompat;->getAbsoluteGravity(II)I

    move-result p4

    and-int/lit8 p4, p4, 0x7

    const/4 v0, 0x5

    if-ne p4, v0, :cond_21

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getWidth()I

    move-result p4

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    sub-int/2addr p4, v0

    sub-int/2addr p2, p4

    :cond_21
    invoke-virtual {p0, p1, p2, p3}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    :goto_24
    return-void
.end method
