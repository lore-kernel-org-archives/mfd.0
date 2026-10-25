Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904601;
	b=F8EIo9mHjT3bMEHEHpKwWWSX5hmjUaUYboyazxXXOBO585LaSTi6OIwTw0glgHdIyxrh
	 pO7D/zEnkUVeneSEzQfclRRay11O9jCbxp+K+wUjbNfCl+Ncf5RjgXqiRlzoRWGl+5W1x
	 G5G5k76rVOmxdYwNXSi+W2SHjl5xuq25g0lwxM/cnCIWbyvTjODvcUThzuxjQPlJ8XNYw
	 Od7RiGydjhZxMLHOIWc42zm+lkVfIWv0ecmfnve589KbuoHvOkKOhhnAA+VeL2BHyu4eN
	 JMhnFEBkdUEoHI5Mp51ZvUbRI8H5VB0lmXkXds2wX2JU0Vul6VbC67E8lopypVrd+MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
	b=uB0TfPgdKyLB/xmNBrCkYe7yitYVodvdp2dVy+irwNZ25+Yoe0OiaSCz+rYPmbRifgox
	 jVbWfYIVswkGx+pr9iVB4SqeDXhTGHt6xfdhX4EywEorrNGiNhGsWpR6rNDemzHIc+mj2
	 JBxvPahjjglFHUfgqJRxx7vsY0vBnhrWKh6ywhzuLN6t29y2bFd1+eFfyOUP5lX2iu88D
	 1qTRI5lNPKqbO0HwT/Ohw1ymbWwPZIeRfw+rHAiWKMpJlzub0uzAtP6blp5jYwJc4uZ7f
	 8TsQz7rrT7OpFFX3mdecaRJqAVoSxqUd7SzEqF4hwAwqFRWhEL8YeAr5RBGUxZ0d0KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nV7paNlJ;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E93606A321
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E93606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nV7paNlJ
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1846bc43c28so2118583c88.0
        for <mfd@lists.linux.dev>; Sat, 24 Oct 2026 22:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904600; x=1793509400; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=nV7paNlJQ9EkG/I70cq3T72z6HHSBTMgOdpAGwRD/h6JqyQ+DhG3fG/5IgZL5FTD9q
         wpKDYmBBVWy9bnOdPVv31gPBHRmN3nOmzaeaGi+WQr9gF8Jz84+q/0yIfNohMw9fAv2a
         nEqFqojvCRRNIefMFN/wmIVSyGgnZz7Ocp5HDtmZibjAwqmQmwSDZhw8Lb76nJ+rbQbH
         vLdG2GKun8H0Bvoz9NXQHG8wJzKs2TUYlcDsqSR4sW11jOsGsYhHmzFVc10wT0Q6AZfv
         jN3hxs3ec8pkD2fLfZLONjRkg6JgQfQ7NmcfOm3ruPuaX8DWwqdO94wo9Rl5DZKKqHao
         f04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904600; x=1793509400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTqaQ6jXWlHRRGLaT8kFyXO3lEvorKEGuHWBDmHOqfE=;
        b=pJnUQknLBsQZgdQv5KBHqOtBTDzwzcIoDlYGz4IC+lMMctIYq+zWIp5uS67IeVJaBo
         TdZ1LJmM9kNQxryVDVafu0caX7Gj/nTGOaMWjLp9bIEN4c/a77MGv6rT+5TaFL4CRxEo
         ncESATtHpK0RrUbSrhZm/LMNu4DGV9CNASND5/++jpWAGnI2LuPIPGRqLYwU3BkvcFbd
         wzrJG6dg/Y+KakUQtdyoHjm4MER/tRddHsjU+/IvLSbaBhgotFO5xMziORKiUG0By89E
         +oioKh/Nz63EmErpRvt5UpPFov8Lc4ghxgvk60VJs7cU1JF5GzQx1viHCJTGCoucTfqd
         bDOg==
X-Gm-Message-State: AFq9FYJI1MIMJq3LAEShshPaz/th/+/wceTylFV6oirP3I6ZQWaBquem
	TsXj9zSb8D8DIQrAXD+8XyBBeDKon7usgOvkLP13zjKX+/+C2qcwVLI0
X-Gm-Gg: AYBFou0HcmIdTySAi1rj7qqw0Z2G4ng8HicmrKXJsT8uJkL2+7Rvi6mEFpNbVHetEWe
	xkPWiKdGpVUehekrMuz8XTgYl0vUai5HC0S/+E0XtPRR+itHZmeFI9XzSMpvjBwM5EhPiRmJIbz
	9YHLj1WcauP8Ey+gMEfi+0X0oRPxACoZ+4F7NP5lx/2hobeBrfWl8yUTWiaTwLboCieU4KmQDUe
	Xuuc/T64YktYb2jVF9sUHUxFRgo76UEe2sFHK7+dUYtFPaSZG6kbrin8W1HOTEIoJnUWniK2X7m
	UoNlt9px/tX/4xGmGfyzU2YsOexC0xa1/YNMO6nL+1VT4NiLFq8g1RjvpELwvHTNw/njwyOmMwk
	5gtLm7rwXq/gJ8WnGHaY+KlxIhSGXCMvo7Y2j3C3ocynOWlkgeG7uFdSE8+q9Ee056Pxz0vbCl/
	EA/brjE2cyvzP/f2K40oecRiwc2V0pa9iGHgc8ODgZcNit1e1yexuKkv+oGmNPm52pYpRQZMF3I
	gbZ0uQytxutt7XDlUIWAPiow9tk5ZgbzIf8NMkwwKaSd6nZrrp55P/8XvCEIZsNILqOSxtaLfoa
	PJ1m/RNiX/laqul+FHk9EAVHCQu2OYAGdGPRO/Oh1dk=
X-Received: by 2002:a05:7022:2513:b0:196:7742:3928 with SMTP id a92af1059eb24-1991b420832mr7262785c88.0.1792904600247;
        Sat, 24 Oct 2026 22:03:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:12 -0700
Subject: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Allow passing software nodes to wm831x DCDC regulators via PMIC platform
data. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

Add software node pointers to the PMIC platform data and have the MFD
core assign them to the buckv cells.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e000cc..c4793be419ba 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/core.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/err.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
 };
 EXPORT_SYMBOL_GPL(wm831x_of_match);
 
+static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
+			      const struct mfd_cell *cells, int num_cells)
+{
+	struct wm831x_pdata *pdata = &wm831x->pdata;
+	int i;
+
+	struct mfd_cell *local_cells __free(kfree) =
+		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
+	if (!local_cells)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cells; i++) {
+		struct mfd_cell *cell = &local_cells[i];
+
+		if (strcmp(cell->name, "wm831x-buckv") == 0) {
+			int id = cell->id - 1;
+
+			if (id >= 0 && id < WM831X_MAX_DCDC)
+				cell->swnode = pdata->dcdc_swnodes[id];
+		}
+	}
+
+	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
+			       NULL, 0, NULL);
+}
+
 /*
  * Instantiate the generic non-control parts of the device.
  */
@@ -1620,15 +1647,13 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	/* The core device is up, instantiate the subdevices. */
 	switch (parent) {
 	case WM8310:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8310_devs, ARRAY_SIZE(wm8310_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8310_devs, ARRAY_SIZE(wm8310_devs));
 		break;
 
 	case WM8311:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8311_devs, ARRAY_SIZE(wm8311_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8311_devs, ARRAY_SIZE(wm8311_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1636,9 +1661,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 		break;
 
 	case WM8312:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8312_devs, ARRAY_SIZE(wm8312_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8312_devs, ARRAY_SIZE(wm8312_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1649,9 +1673,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8321:
 	case WM8325:
 	case WM8326:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8320_devs, ARRAY_SIZE(wm8320_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8320_devs, ARRAY_SIZE(wm8320_devs));
 		break;
 
 	default:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d5d9d9600756 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -132,6 +133,7 @@ struct wm831x_pdata {
 	struct wm831x_status_pdata *status[WM831X_MAX_STATUS];
 	/** DCDC1 = 0 and so on */
 	struct regulator_init_data *dcdc[WM831X_MAX_DCDC];
+	const struct software_node *dcdc_swnodes[WM831X_MAX_DCDC];
 	/** EPE1 = 0 and so on */
 	struct regulator_init_data *epe[WM831X_MAX_EPE];
 	/** LDO1 = 0 and so on */

-- 
2.56.0.257.gf7497c7d27-goog

