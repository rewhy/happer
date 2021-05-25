.class Landroid/support/v4/app/ActionBarDrawerToggle$SetIndicatorInfo;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/ActionBarDrawerToggle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SetIndicatorInfo"
.end annotation


# instance fields
.field mSetHomeActionContentDescription:Ljava/lang/reflect/Method;

.field mSetHomeAsUpIndicator:Ljava/lang/reflect/Method;

.field mUpIndicatorView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_5
    const-class v2, Landroid/app/ActionBar;

    const-string v3, "setHomeAsUpIndicator"

    new-array v4, v1, [Ljava/lang/Class;

    const-class v5, Landroid/graphics/drawable/Drawable;

    aput-object v5, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/app/ActionBarDrawerToggle$SetIndicatorInfo;->mSetHomeAsUpIndicator:Ljava/lang/reflect/Method;

    const-class v2, Landroid/app/ActionBar;

    const-string v3, "setHomeActionContentDescription"

    new-array v4, v1, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/app/ActionBarDrawerToggle$SetIndicatorInfo;->mSetHomeActionContentDescription:Ljava/lang/reflect/Method;
    :try_end_25
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_25} :catch_26

    return-void

    :catch_26
    nop

    const v2, 0x102002c

    invoke-virtual {p1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_31

    return-void

    :cond_31
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_3f

    return-void

    :cond_3f
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v1, v2, :cond_4e

    goto :goto_4f

    :cond_4e
    move-object p1, v0

    :goto_4f
    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_57

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Landroid/support/v4/app/ActionBarDrawerToggle$SetIndicatorInfo;->mUpIndicatorView:Landroid/widget/ImageView;

    :cond_57
    return-void
.end method
