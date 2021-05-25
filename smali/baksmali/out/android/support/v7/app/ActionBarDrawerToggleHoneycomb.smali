.class Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggleHoneycomb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarDrawerToggleHC"

.field private static final THEME_ATTRS:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x101030b

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb;->THEME_ATTRS:[I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getThemeUpIndicator(Landroid/app/Activity;)Landroid/graphics/drawable/Drawable;
    .registers 2

    sget-object v0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb;->THEME_ATTRS:[I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return-object v0
.end method

.method public static setActionBarDescription(Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;Landroid/app/Activity;I)Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
    .registers 6

    if-nez p0, :cond_7

    new-instance p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    :cond_7
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_34

    :try_start_b
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x13

    if-gt p2, v0, :cond_34

    invoke-virtual {p1}, Landroid/app/ActionBar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_2b} :catch_2c

    goto :goto_34

    :catch_2c
    move-exception p1

    const-string p2, "ActionBarDrawerToggleHC"

    const-string v0, "Couldn\'t set content description via JB-MR2 API"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_34
    :goto_34
    return-object p0
.end method

.method public static setActionBarUpIndicator(Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;Landroid/app/Activity;Landroid/graphics/drawable/Drawable;I)Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;
    .registers 8

    new-instance p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;

    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;-><init>(Landroid/app/Activity;)V

    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2f

    :try_start_9
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeAsUpIndicator:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->setHomeActionContentDescription:Ljava/lang/reflect/Method;

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v0, v3

    invoke-virtual {p2, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_25} :catch_26

    goto :goto_40

    :catch_26
    move-exception p1

    const-string p2, "ActionBarDrawerToggleHC"

    const-string p3, "Couldn\'t set home-as-up indicator via JB-MR2 API"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_40

    :cond_2f
    iget-object p1, p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    if-eqz p1, :cond_39

    iget-object p1, p0, Landroid/support/v7/app/ActionBarDrawerToggleHoneycomb$SetIndicatorInfo;->upIndicatorView:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_40

    :cond_39
    const-string p1, "ActionBarDrawerToggleHC"

    const-string p2, "Couldn\'t set home-as-up indicator"

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_40
    return-object p0
.end method
