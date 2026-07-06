Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1673DCD99
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783379294; cv=none; b=DQ1Ai+m2lLyI0BHnkkI+8HF8mwgKkOuH4YZG2RuYnnSYm2zH5ZGQgm0ljgHT7m+lDf8Uoe6t8X9DS+CQBUsS8m4BPvgLeOD6LsyZyUQjrJxj1XAxIpYD/1iBc6f70cNcyv97YiNJdq800TYLJkQhY0+8HnaHSQsnTH9JESujBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783379294; c=relaxed/simple;
	bh=ZsH2mhoTn+4LyIOxcWmlTMcbwZtvd4wkXs7IPubdVhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfX7VttvynowxY7bJlF3GMcYQngvUsR2Ehx82NB3WFgbWOjc5tqSsWrUE5UBq3Pe1CfMw26uVM8FBCUq2sVTeIl+dpYm/lIxVDfwReVCCn2CUBF6EapbuosTXq1AiRE/aNceE4qY2/oDPLzJESvMjcr7O8NjIOOZxzmjssSt8iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZ3a8y3g; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZ3a8y3g"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381018b9375so3643032a91.0
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 16:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783379292; x=1783984092; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iHyWK1AiRinQ8FOJrMNctgRje0UcauACIBMIEEqVRg=;
        b=qZ3a8y3gbYANuV2xUWm4hD2m7zfGEQlT6Jol2UnKqvxr7yE/tGtOIyFr6twYDY1sWt
         CcdARFR3HZYxY1eyKqh2/wDlvYPGKUzTQHatHMG5pEv4NEPxah7sqmWniKrobEerNB6E
         U052jLvGG2iVN9t2kZErBE7SXmF9s976DexLcdaIpfh1xPNKTaqdq+Xg64VtzGWi/4bC
         St6YiY9POK0tFsTenjQjBLjm82+VszqKwIm9TAvaBSDfbpjvUC/2mx0V2pANdCIIYKEn
         BL8nLjPYDMUI9GpLVol6jzhMfobwE+1L2ZkzibnQCafl84IA1MazhjjIBBXm9H8ZZH5V
         3n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783379292; x=1783984092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iHyWK1AiRinQ8FOJrMNctgRje0UcauACIBMIEEqVRg=;
        b=ryp5s9iZ8l8DYrAUYGnz2VVAKV1JQRWexpf0RMy5R9Age9laOEm6Q+DlDyBtFJkW4A
         3yHKAyYJfZH6OWkdf8VEaI3mooMNXwWEqBQXtPhKr82m79Ntci+NjMKi9m5tDAKh2XyB
         wqhNC6H0uO5eQo4dm4u8+ehXQo3BMSjPYjNutl7knAkMDlkwF5TLhSf3JXlAUVkAz+B+
         gYvsqYScRjK7ntP9DC8bKOUA2odQMVMyOMOL47zas0hbZOzLRhc5KMIje2D+U2KSNcHN
         7yYXCPV4G0Q6oVkuBryaw3ETTR0GDzscy+dSETPZ6vptChTBlxVvRrNEAYOVYByuSK8t
         1/2g==
X-Gm-Message-State: AOJu0YxFOsiAk69CkoWuE439M74ougU33lOiyN7BfT1/jsShADJIogEX
	OVeMitKcuprDLYw7JsyEmi9CJkhunS6UQRqGRAcThAIKUHKCXRlgXm6KRjp5ag==
X-Gm-Gg: AfdE7cmyqgLCC6km2Ofr0ypUv30nal+t06w+ob0qxVoAhLOiOtouyUgUuvrKEy6yPRD
	bIdBBWScbIcC5SCWBZ+pgtS6TClZ6tXb/xq2nr21BL1ABU0hJyrJtE/Demxq8wWzGkI3dDQR6IZ
	6ZegM+DtExT25F67yj+pR6Vyc2SCk9+TdX/4SMXYgfSqyf2WyU9mmZx/DuwlDYLQT2evq4Mw04V
	zqUD1E9QabOIWX7oiEb9J3TJTHK7DFxqXlKSnM7EUz997R48qWQfO4kB06upYrg3Fl6+4v0hRt6
	11zvRznitZ7qEp5R1Sg0OJgy2JLev4jEpUD8pizLJZ0p0Fhqn6BxrQnyQH8lu4vqlLD0LID7GKz
	mZ6Fp/iUHkDblAsNsRpnV4TLCHmP+lur59UatQ1KHZUsNJXVdm4m/pbP7xSxMctY/GiPbV0FRwW
	8bgMWGbYwH2XDVC+OMCQACVn90VQzfJ3xF7S1uD1SWng4k8gaZRtjNkdNaj715tEQWm54cPAtpb
	kQU
X-Received: by 2002:a17:90b:586d:b0:37f:9ce1:cdb3 with SMTP id 98e67ed59e1d1-3875a1ba886mr2628524a91.33.1783379292456;
        Mon, 06 Jul 2026 16:08:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f598dsm1259148eec.6.2026.07.06.16.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 16:08:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 16:08:04 -0700
Subject: [PATCH 1/2] mfd: ucb1x00: register software node for GPIO
 controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ucb1x00-assabet-swnode-v1-1-6102eabd31d0@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Define a static software node for the UCB1x00 GPIO controller and attach
it to the core MFD device in ucb1x00_probe(). This node will also be
used by the created GPIO chip.

This allows machine subdrivers (such as Assabet evaluation board
support) to reference the UCB1x00 GPIO controller in property entries
when converting legacy platform data to software nodes, resolving pin
bindings directly via the attached firmware node without relying on
name matching.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/ucb1x00-core.c  | 12 ++++++++++++
 include/linux/mfd/ucb1x00.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
index 16f64e2b2f77..8d1c34c53955 100644
--- a/drivers/mfd/ucb1x00-core.c
+++ b/drivers/mfd/ucb1x00-core.c
@@ -25,8 +25,13 @@
 #include <linux/mutex.h>
 #include <linux/mfd/ucb1x00.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/gpio/driver.h>
 
+const struct software_node ucb1x00_gpiochip_node = {
+	.name = "ucb1x00-gpio",
+};
+
 static DEFINE_MUTEX(ucb1x00_mutex);
 static LIST_HEAD(ucb1x00_drivers);
 static LIST_HEAD(ucb1x00_devices);
@@ -530,6 +535,10 @@ static int ucb1x00_probe(struct mcp *mcp)
 	ucb->id  = id;
 	ucb->mcp = mcp;
 
+	ret = device_add_software_node(&ucb->dev, &ucb1x00_gpiochip_node);
+	if (ret)
+		goto err_swnode_add;
+
 	ret = device_add(&ucb->dev);
 	if (ret)
 		goto err_dev_add;
@@ -604,6 +613,8 @@ static int ucb1x00_probe(struct mcp *mcp)
  err_no_irq:
 	device_del(&ucb->dev);
  err_dev_add:
+	device_remove_software_node(&ucb->dev);
+ err_swnode_add:
 	put_device(&ucb->dev);
  out:
 	if (pdata && pdata->reset)
@@ -630,6 +641,7 @@ static void ucb1x00_remove(struct mcp *mcp)
 
 	irq_set_chained_handler(ucb->irq, NULL);
 	irq_free_descs(ucb->irq_base, 16);
+	device_remove_software_node(&ucb->dev);
 	device_unregister(&ucb->dev);
 
 	if (pdata && pdata->reset)
diff --git a/include/linux/mfd/ucb1x00.h b/include/linux/mfd/ucb1x00.h
index ede237384723..214c71a12e84 100644
--- a/include/linux/mfd/ucb1x00.h
+++ b/include/linux/mfd/ucb1x00.h
@@ -103,6 +103,9 @@
 #define UCB_MODE_DYN_VFLAG_ENA	(1 << 12)
 #define UCB_MODE_AUD_OFF_CAN	(1 << 13)
 
+struct software_node;
+extern const struct software_node ucb1x00_gpiochip_node;
+
 enum ucb1x00_reset {
 	UCB_RST_PROBE,
 	UCB_RST_RESUME,

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

