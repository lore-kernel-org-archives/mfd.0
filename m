Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D73769E7
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 01:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785894165; cv=none; b=Ak6Ze3yrKocAZnd+gucdK24DvK4fV5DNl9lrEJxki81pD2w0ClLrsuX8JKMSmZ6sxrXa1XwzGsZBjGehjr8rfoiGFzY3f3GAnDhkKVS9867wOe4zU9/dFDQ1Z/fgaYVWE27TiRokL2LSadF+1+RYPCgUW7PrzOK3mwUl61/tQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785894165; c=relaxed/simple;
	bh=ekYyjbGDCMIjKTojcaxhwQ+AMRhdvTKOaGTvjM0ayMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euiGjPxeCrXlFfNSParlLfjXyn98UiJDnp4+/rR+wiwxkfT5fX3t3xtOSMamSZ6HjTy+ukRAYC7JaJPka2q8J9cf9a2DssjXcrwgzqAiEdFY6IKoISfFR5JOpu2SQ99Y0Up1166YphX+7ao1aXkssyLEtDbUAM70rw0nIE0aVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFDfH3er; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFDfH3er"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso304904a12.0
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 18:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785894160; x=1786498960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WtsicDUzlvcscfC5dX4W8BMmJ9vs/CpiKg/Y+8Yj9KE=;
        b=fFDfH3er91Nz5xQp8ieYEoTt7uxdRm/Mc7WEWAEfQFUetMhPkGx18xStW3xT1MJhUc
         PcPJOGMz9tWR4vBHDaldP8ZTdqdhkkflyxxNuKIWaflosSz+rKhErj5OYTng2ynpZ7Rs
         GhnuIh6JQKKV3Qy0qJBWdNu6EFeUNA84zedmrB9Lwn8TToadfALba/72rFM1DxmXch6B
         Tfd6tMmAdpewAJj1yUXp1uXi2eUBijNWg+a9j1LSOemKZCtc+6ML/rQlqH56J0JEDZeu
         6RtrIABWUUYHwZguSqchcyUoz3x1/jUYYoZahvlb+wTXDvUq0fH6AUSDwqsZygz1YWMr
         vFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785894160; x=1786498960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtsicDUzlvcscfC5dX4W8BMmJ9vs/CpiKg/Y+8Yj9KE=;
        b=lh98ha2+JKQbkIn+c2/MDA1MEKaYWs8fL0qYiJlfQdyEk1aG+5B4kdvOBlbTA2j2U9
         PVzeKxTSI5DvGQUphCJSXiBqOpNpm0AWLa5BJR/7WayIuDwFF7LRme55i+wWoqO9P6yR
         3LzSskctaWUcTr1zp3XnkhP531rGqYxrdoU7arMzLI2b/6JRSbwFoyawHXltTbaT6tJx
         h81VihRsDaS8PIMG5Z2zjmQNpu1/inZCY4lkj1WuLOGaLCwv/ewvypZtmA4I6XrztL/u
         VW8Xh0gL+lfcaYfc66+j43wQf5UZCgVbeq1scMIgrIR6o43x42C41MRJyWSxZFr5nuTG
         Wl+Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro4D74g3c4df1QHJbdpxzLt5CEL0ft5eTNJCbrQO+tPNHevRpCetJd0uRjLoEyyLsAhi+M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7VJVNNfr3cZc0m9NcZVJRj5wXdi+Lk46LX5MvGx7NpLm/vX4L
	ANnN5D6s2uuctiBJDKId/YJk145QpOZTG1cwLw2OlYs2wGuigv8SogL+
X-Gm-Gg: AR+sD10qYroRx5CdZR0ZlUmEQJPh06NrfSiT/12l7v/I1m5hl3PtC2wx3hmbGtnSjAh
	8UEZw6DzzX7yNcfmvu/WNgK/NxQt5suH8MQXLJbM813wL3cmddoWuf2Sg6kGNmf94xwFk/V/Tp+
	Ywibh8Dw7o8Z5O0KwJRwuKSgtZe6aRhfp0m7sWqltGieNqeF0yRaXCSPFA1ZqTytKKoFN9+DAbI
	b6nwO8CkpeJss2gv5CfIPs5u/p3hijadWn2F0EHEQi6MCME9PvkX7qWONNGkZktyhZGxpVvAvtd
	WLQiEzREhumQABcSPFPdVqyPuwsi1lGjWJWMYgu9bG4FTBcomd8f8qJjC9YwVFEpOPyeFlyB3aw
	uaOfDn5zYhEwfbFlOQW2Fb4abfborSYSrE20/zkfys3O132BTYQj5v4M2USKjojIdfwz4GWarv1
	75QIy8rajQ/xl7xyi8vyIYVypCWiHE+Ue3k5QLa+qqN1D5U2/BjpgoFKyfspkVVWgZh387ZwsHI
	8v0UwaCFshtMoJkDR62nJHvKDhM8L9bRPvkM6kKx2mTnnI8cS6wBl4eE8Bm
X-Received: by 2002:a05:6a00:6c95:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-84f2e022798mr3333888b3a.4.1785894160046;
        Tue, 04 Aug 2026 18:42:40 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e507c38sm333744b3a.43.2026.08.04.18.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 18:42:39 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: lee@kernel.org,
	sre@kernel.org,
	linux@roeck-us.net
Cc: patches@opensource.cirrus.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] mfd: wm8350: propagate ADC read timeout instead of returning 0
Date: Tue,  4 Aug 2026 19:42:21 -0600
Message-ID: <20260805014221.16412-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wm8350_read_auxadc() logs an error via dev_err() when the AUX ADC
read times out, but then falls through to return the masked value
of `result`, which was left at its initial value of 0. Callers have
no way to distinguish a genuine 0V reading from a failed read.

Return -ETIMEDOUT on timeout instead, and update the wm8350 hwmon
and power_supply drivers, which call this function directly, to
check for a negative return and propagate the error rather than
using it as a voltage value.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/hwmon/wm8350-hwmon.c        |  9 ++++--
 drivers/mfd/wm8350-core.c           | 14 ++++++---
 drivers/power/supply/wm8350_power.c | 45 ++++++++++++++++++++++-------
 3 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/wm8350-hwmon.c b/drivers/hwmon/wm8350-hwmon.c
index 10e17bb79895..a455e1c5476c 100644
--- a/drivers/hwmon/wm8350-hwmon.c
+++ b/drivers/hwmon/wm8350-hwmon.c
@@ -23,14 +23,17 @@ static const char * const input_names[] = {
 };
 
 static ssize_t show_voltage(struct device *dev,
-			    struct device_attribute *attr, char *buf)
+			  struct device_attribute *attr, char *buf)
 {
 	struct wm8350 *wm8350 = dev_get_drvdata(dev);
 	int channel = to_sensor_dev_attr(attr)->index;
 	int val;
 
-	val = wm8350_read_auxadc(wm8350, channel, 0, 0) * WM8350_AUX_COEFF;
-	val = DIV_ROUND_CLOSEST(val, 1000);
+	val = wm8350_read_auxadc(wm8350, channel, 0, 0);
+	if (val < 0)
+		return val;
+
+	val = DIV_ROUND_CLOSEST(val * WM8350_AUX_COEFF, 1000);
 
 	return sprintf(buf, "%d\n", val);
 }
diff --git a/drivers/mfd/wm8350-core.c b/drivers/mfd/wm8350-core.c
index fbc77b218215..3120c6b8fa3f 100644
--- a/drivers/mfd/wm8350-core.c
+++ b/drivers/mfd/wm8350-core.c
@@ -188,6 +188,7 @@ EXPORT_SYMBOL_GPL(wm8350_reg_unlock);
 int wm8350_read_auxadc(struct wm8350 *wm8350, int channel, int scale, int vref)
 {
 	u16 reg, result = 0;
+	int ret = 0;
 
 	if (channel < WM8350_AUXADC_AUX1 || channel > WM8350_AUXADC_TEMP)
 		return -EINVAL;
@@ -221,19 +222,24 @@ int wm8350_read_auxadc(struct wm8350 *wm8350, int channel, int scale, int vref)
 	wait_for_completion_timeout(&wm8350->auxadc_done, msecs_to_jiffies(5));
 
 	reg = wm8350_reg_read(wm8350, WM8350_DIGITISER_CONTROL_1);
-	if (reg & WM8350_AUXADC_POLL)
+	if (reg & WM8350_AUXADC_POLL) {
 		dev_err(wm8350->dev, "adc chn %d read timeout\n", channel);
-	else
+		ret = -ETIMEDOUT;
+	} else {
 		result = wm8350_reg_read(wm8350,
-					 WM8350_AUX1_READBACK + channel);
+					WM8350_AUX1_READBACK + channel);
+	}
 
 	/* Turn off the ADC */
 	reg = wm8350_reg_read(wm8350, WM8350_POWER_MGMT_5);
 	wm8350_reg_write(wm8350, WM8350_POWER_MGMT_5,
-			 reg & ~WM8350_AUXADC_ENA);
+			reg & ~WM8350_AUXADC_ENA);
 
 	mutex_unlock(&wm8350->auxadc_mutex);
 
+	if (ret)
+		return ret;
+
 	return result & WM8350_AUXADC_DATA1_MASK;
 }
 EXPORT_SYMBOL_GPL(wm8350_read_auxadc);
diff --git a/drivers/power/supply/wm8350_power.c b/drivers/power/supply/wm8350_power.c
index b0eb6e0ce8bc..111373027905 100644
--- a/drivers/power/supply/wm8350_power.c
+++ b/drivers/power/supply/wm8350_power.c
@@ -19,20 +19,32 @@
 
 static int wm8350_read_battery_uvolts(struct wm8350 *wm8350)
 {
-	return wm8350_read_auxadc(wm8350, WM8350_AUXADC_BATT, 0, 0)
-		* WM8350_AUX_COEFF;
+	int val = wm8350_read_auxadc(wm8350, WM8350_AUXADC_BATT, 0, 0);
+
+	if (val < 0)
+		return val;
+
+	return val * WM8350_AUX_COEFF;
 }
 
 static int wm8350_read_line_uvolts(struct wm8350 *wm8350)
 {
-	return wm8350_read_auxadc(wm8350, WM8350_AUXADC_LINE, 0, 0)
-		* WM8350_AUX_COEFF;
+	int val = wm8350_read_auxadc(wm8350, WM8350_AUXADC_LINE, 0, 0);
+
+	if (val < 0)
+		return val;
+
+	return val * WM8350_AUX_COEFF;
 }
 
 static int wm8350_read_usb_uvolts(struct wm8350 *wm8350)
 {
-	return wm8350_read_auxadc(wm8350, WM8350_AUXADC_USB, 0, 0)
-		* WM8350_AUX_COEFF;
+	int val = wm8350_read_auxadc(wm8350, WM8350_AUXADC_USB, 0, 0);
+
+	if (val < 0)
+		return val;
+
+	return val * WM8350_AUX_COEFF;
 }
 
 #define WM8350_BATT_SUPPLY	1
@@ -257,7 +269,10 @@ static int wm8350_ac_get_prop(struct power_supply *psy,
 				 WM8350_LINE_SUPPLY);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		val->intval = wm8350_read_line_uvolts(wm8350);
+		ret = wm8350_read_line_uvolts(wm8350);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 	default:
 		ret = -EINVAL;
@@ -287,7 +302,10 @@ static int wm8350_usb_get_prop(struct power_supply *psy,
 				 WM8350_USB_SUPPLY);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		val->intval = wm8350_read_usb_uvolts(wm8350);
+		ret = wm8350_read_usb_uvolts(wm8350);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 	default:
 		ret = -EINVAL;
@@ -308,8 +326,12 @@ static enum power_supply_property wm8350_usb_props[] = {
 static int wm8350_bat_check_health(struct wm8350 *wm8350)
 {
 	u16 reg;
+	int uvolts = wm8350_read_battery_uvolts(wm8350);
+
+	if (uvolts < 0)
+		return POWER_SUPPLY_HEALTH_UNKNOWN;
 
-	if (wm8350_read_battery_uvolts(wm8350) < 2850000)
+	if (uvolts < 2850000)
 		return POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
 
 	reg = wm8350_reg_read(wm8350, WM8350_CHARGER_OVERRIDES);
@@ -356,7 +378,10 @@ static int wm8350_bat_get_property(struct power_supply *psy,
 				 WM8350_BATT_SUPPLY);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		val->intval = wm8350_read_battery_uvolts(wm8350);
+		ret = wm8350_read_battery_uvolts(wm8350);
+		if (ret < 0)
+			return ret;
+		val->intval = ret;
 		break;
 	case POWER_SUPPLY_PROP_HEALTH:
 		val->intval = wm8350_bat_check_health(wm8350);
-- 
2.55.0

