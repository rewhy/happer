.class public Landroid/support/v4/graphics/TypefaceCompatApi28Impl;
.super Landroid/support/v4/graphics/TypefaceCompatApi26Impl;
.source "TypefaceCompatApi28Impl.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final CREATE_FROM_FAMILIES_WITH_DEFAULT_METHOD:Ljava/lang/String; = "createFromFamiliesWithDefault"

.field private static final DEFAULT_FAMILY:Ljava/lang/String; = "sans-serif"

.field private static final RESOLVE_BY_FONT_TABLE:I = -0x1

.field private static final TAG:Ljava/lang/String; = "TypefaceCompatApi28Impl"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/support/v4/graphics/TypefaceCompatApi26Impl;-><init>()V

    return-void
.end method


# virtual methods
.method protected createFromFamiliesWithDefault(Ljava/lang/Object;)Landroid/graphics/Typeface;
    .registers 7

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/graphics/TypefaceCompatApi28Impl;->mFontFamily:Ljava/lang/Class;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v0, v2, p1}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    iget-object p1, p0, Landroid/support/v4/graphics/TypefaceCompatApi28Impl;->mCreateFromFamiliesWithDefault:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v0, v4, v2

    const-string v0, "sans-serif"

    aput-object v0, v4, v1

    const/4 v0, 0x2

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v0

    invoke-virtual {p1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Typeface;
    :try_end_2c
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_2c} :catch_2d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_2c} :catch_2d

    return-object p1

    :catch_2d
    move-exception p1

    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method protected obtainCreateFromFamiliesWithDefaultMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    const-class v1, Landroid/graphics/Typeface;

    const-string v2, "createFromFamiliesWithDefault"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const-class p1, Ljava/lang/String;

    aput-object p1, v3, v0

    sget-object p1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x2

    aput-object p1, v3, v4

    sget-object p1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x3

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    return-object p1
.end method
