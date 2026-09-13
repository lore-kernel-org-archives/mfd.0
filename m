Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2837E5E9
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332626; cv=none; b=orsYjgFBgkeZGM2CsNOovKFue3bG+71rpNsvdd/FeW9jJpKNR7i6IVc0XfJbkMLPbroDXiwUdMC7BTqysX7Loi0T6hNId5dDEzK6C8Nl7T8G74RrzkwjfjbD5QvJyKOaKjnghNWEbPKQWf+g0rkiPizdZZwDyiIInUs17OaBbzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332626; c=relaxed/simple;
	bh=cjSdxH7baFihtM/V1AMCnUMKfob28Q3GgdzY21w2Wkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PwRHLJ5DCiQNDYPCR4+S/OytdClzDbxu9vpLZv1tIGkl4O8OYCCxZUuiy59N/IotSd5Z/AkvOaYMoHD7FIA50Ky8oQXhTZPGV835bkTHGtYmxO6hSbiNpQG5XyTzVH8aejAgngNI6Li+4/Jy1vYlfDOspccZwYO5u+RN1sLv8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtJ3RpK2; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtJ3RpK2"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb7692a57so16535881cf.1
        for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 13:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789332624; x=1789937424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMTgWivp0e7gelEPDHuWnCELoEKFxvhsWudexAHdLaU=;
        b=RtJ3RpK2RQLeM/yB+dH5Wra8fKCErzII4eJ5FVBS2e7Poy63I7ZLKEt9au5eLaBefz
         t9ib6pnmNYIiPeYc/cOBskhAMSuz9OUDK4JKFZeiQlpudua/swmZfGLrXiZRjgC9kkCs
         eqoGibSj8ei1Xm5lFZyI3CiVy5KIJylda8ffT8idwanZaWa6rh3qxI49ygAbBKkXxCAF
         QnFEmlCxLGOC5ZCdeMdfO1HjaM4iN/w7uQ0nzjIBukbKwLeRA2tO625vl3bzB7fEM3xC
         V//XnkhAI1NNMVgDaJ9lTw2AOkiPV4M7X2+6ZiMF4fgsYrJ3q6nJldLptdekUIygEEfU
         zQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332624; x=1789937424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMTgWivp0e7gelEPDHuWnCELoEKFxvhsWudexAHdLaU=;
        b=QiQF3aCXMwhD5/r6cmU3NewqgKYO44wpViWsMTpXA86tQVkdokOy+JRQBRsd1eQtsT
         atRNcTlubHEvVgWsDRY8BXkGI7h9mYFL8En6szCgomHDeiF5abPRGLDa3r+evjrTn9xM
         M9NP3XR0An3BlF3WGuKyguNZIFRuoWXBbhaAdqMAIMFcAFt8gWNLPermvO81+lT/+54+
         Z61THw0lKlTJLvfW71WIj4pSw4usojyx3H6UsUX60Igmby16peXOklIkfZgBw0iOopwy
         xFs7czdLYGAczEKdQSPiWnsWogjVSw/LPv0MTWiZeUvIe+VFNm4gKsmbzSB8WEmz4nLw
         S22A==
X-Forwarded-Encrypted: i=1; AKwUvBywawKjmNTG6+Eb1wv/QA1HIYEyfN9FFR8Lx+RiSvzYsihQkGFo702RlZoezoWFdPF0l9k=@lists.linux.dev
X-Gm-Message-State: AFuF++ni0Exg/vU1jo8uNzdC7oz9R5HDLg65BdwcIs2S6+gO6Qza3xkw
	Uh/Jk+BmZ/fqszC/v2KyTkCv4HtuKWEaBUZkV8gRMjcBOXlwOXAeQTo=
X-Gm-Gg: AYBFou2xrFXhaz9bEcPE0tTaJifOj5JO0TYAq20N2xQVlDe5A8kn9UiEkP8p5f2XcM9
	R3AcRegnnq3EJVaosVJuZXWENZvNYcfVFara0Wyoly75/w5lSR69hZqJJePPXTKe1/a3M27fV5P
	EH4x/6t8bG0WxPeAiJgRWwgVIFL4VuzRsrZhMDArWBLFMbCxJJbr7ulUArlvc9IA31pSBYc/km6
	FJUY881m0ANfZEHRacyrK7agANCYBZ83sEaq0Wn7CRGzetExHVRyIuKb8AJ/uNW0RduKtoPDc2n
	PDNAeD1t9oO8frT8HCOT3ArqhiKk3WuYigY6ZwFSg55j2A8RaroeNjliDxd88GfKzbEA3i2M50r
	dtbSrXGLV4IUGG8vG+cEHM5CtV/WRMfvsYe79DsTdzTE7m+9wmxXU0V6+07FKVU6ozqc9pja43T
	c3TwNlnDJA+f83cOLhXhpAGX/siXuBek94Yres5CR+t8q4UuWSFHkZGTCBm5g+0mEHtI8/cVFF/
	XwaBe+JrmeI7fQEGqqNYoYtTAxxUh20fHQlCt+JaD4UNWqkWi+Nfu/jKpRnBGhD6dBf9ZloV7vA
	FRtuHNauZ0r5W/cm5zQXyCQykGfgG6j+pw==
X-Received: by 2002:a05:622a:1355:b0:530:ba79:edd3 with SMTP id d75a77b69052e-530e832fe99mr121931421cf.62.1789332624296;
        Sun, 13 Sep 2026 13:50:24 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4ba156sm79460671cf.19.2026.09.13.13.50.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 13:50:22 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: twl-core: unregister the auxiliary platform device on unbind
Date: Sun, 13 Sep 2026 16:50:12 -0400
Message-ID: <20260913205013.54777-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

twl_probe() registers a standalone platform device named "twl", but keeps
its pointer only in a local variable. Probe errors unregister the device,
while successful probe leaves no way for twl_remove() to release it. The
platform device therefore remains registered after the I2C driver unbinds.

Register a managed action on the I2C device immediately after adding the
platform device. This unregisters it on probe failure and driver unbind,
and also handles failure to register the action itself. Remove the manual
error-path unregister to avoid releasing the device twice.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: defa6be1c821 ("mfd: Fix compile for twl-core.c by removing cpu_is_omap usage")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/twl-core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index c024a28b0..128cd3f6c 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -719,6 +719,11 @@ static const struct mfd_cell twl6032_cells[] = {
 	{ .name = "twl6032-clk" },
 };
 
+static void twl_unregister_device(void *data)
+{
+	platform_device_unregister(data);
+}
+
 /* NOTE: This driver only handles a single twl4030/tps659x0 chip */
 static int
 twl_probe(struct i2c_client *client)
@@ -754,17 +759,22 @@ twl_probe(struct i2c_client *client)
 		return status;
 	}
 
+	status = devm_add_action_or_reset(&client->dev, twl_unregister_device,
+					  pdev);
+	if (status)
+		return status;
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_dbg(&client->dev, "can't talk I2C?\n");
 		status = -EIO;
-		goto free;
+		goto out;
 	}
 
 	twl_priv = devm_kzalloc(&client->dev, sizeof(struct twl_private),
 				GFP_KERNEL);
 	if (!twl_priv) {
 		status = -ENOMEM;
-		goto free;
+		goto out;
 	}
 
 	if ((id->driver_data) & TWL6030_CLASS) {
@@ -784,7 +794,7 @@ twl_probe(struct i2c_client *client)
 					 GFP_KERNEL);
 	if (!twl_priv->twl_modules) {
 		status = -ENOMEM;
-		goto free;
+		goto out;
 	}
 
 	for (i = 0; i < num_slaves; i++) {
@@ -880,7 +890,7 @@ twl_probe(struct i2c_client *client)
 		status = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
 					      cells, num_cells, NULL, 0, NULL);
 		if (status < 0)
-			goto free;
+			goto out;
 
 		if (of_device_is_system_power_controller(node)) {
 			if (!pm_power_off)
@@ -896,10 +906,7 @@ twl_probe(struct i2c_client *client)
 fail:
 	if (status < 0)
 		twl_remove(client);
-free:
-	if (status < 0)
-		platform_device_unregister(pdev);
-
+out:
 	return status;
 }
 
-- 
2.39.5
