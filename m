Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446173;
	b=jbfwTXzsCmzUWt5RUAHveuTdT25TGD+dPP3b8yNMCYvPWaLScqe8ZHiAqkK+gSFKkMGk
	 i0GWCVbuFflAclitxQn/t32MbOVavAZBt37gUz7VsVaLI08iUs2bS5/wqrth2BJiyc689
	 wVDXDGDyctkpnagf9uNUVR/RCecLVaGkBWXu6DXtRbAqU3hp4Dog3uD2TD1FXwg60rcAi
	 6GMRwiQuoKew2MVgthAP52kBY1Dk/iuoFRWxumKjIvXwx3gJmR6pK5VBdi40En6Lejwrw
	 4at6yahn/JUmSFDylSupvJOLTEokUh2pV6E8ZQ2gTnEqqCw40UveoGkkWbdR1vscYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
	b=FvpXR5ToaneJ/g+HVpijzXufTJVT3Sb/6akKX4q/PbSL5X0QSFk99LZp4GdAHiGXLfoB
	 2XmW4TrjUawf7NNcGuCnoPmA96SoQLrnbtaiKT9aSlXEmGah6KyLYUTJcBw00zVkprq/i
	 rlchp5GZTuihNmykNj2Q9H1SB8YOD6h0CX4MbHzVCb9eZ1GPxCnvGlfdhi+JQredHNQsX
	 Lb/+vH1+CnhmhgzPwmYvQkboUP5k3j52LXfR1h2JTLTpoWo7QzldVLnjDeFS+2KnE2gke
	 FIZz8bcSJTkQ+nLa02UOk8SCe9j+ohMFyHhiMDV3jXGrJ9T38bZjEEs+QLyWw+ral/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ifLTmh1;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9B260A2600
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9B260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ifLTmh1
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d427836e9so470747366b.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446171; x=1796050971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
        b=0ifLTmh1PN5Eb8Cu5RylrC1cIyBcfeCpteAAPQef2av4LjFVXSqK3S8T7vyS6Kug0W
         66LwJtjaQ35dOGRTKLyCK9o/ohsk08blxqo91wuaGObnDdGY8KjTeLXkobMPhcA4JwoK
         G4hYsIQefSMVsPfxR1X4ADg2IHA2KLmmPQ4JgptiCqkxUTox+6VsCwt8H7Q4kIca8mki
         qi0zhXhPytDkgo/Gk1DQqHxBe/gdqfycGrYIFOlmCKGawlkrLA0lhBmukcygXw2HsHsv
         YgI1zQrQHcNArsaJvKaEENIsO4hb9J1rWAgukGnkAu0cG7h4BugG4eHw6midliqBgSPB
         92Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446171; x=1796050971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
        b=U5C2p9ub7NFZyQWeocQaUPEt2AxXhyIV6o+glVH4A1b7rQj3N75dwPW7VyjWFeaSSI
         XucoOftS1cROfYdz4sbDEqdGWoySECOuFdvQcEoH0yk32Se0a9UwOuXtvfcrj+eAiVpa
         2fywSovTi2ynopLqN/SpUmGYmrk76ocbw4AonxEQSwNaRD7Dfs7LPXF2Jx60J4qF0MaC
         f+XO/t5i4cfDQjAD4wIu4Ugja89w0XveDBGTkMwPRSNerQ8QNIdSZHQLTtMWNnFeDjcB
         Kz50uVLkHG9fy5O2Gx8z0EQKfK8+G7pa8xhXwaSWhhECPEg8CTEd/3VXhbBtZsczGpy5
         DJlw==
X-Forwarded-Encrypted: i=1; AL+hErEnSpPljVP8G1JlKZ/WFHawfaSlVVgkEx8QBA53VpFhQ+5bqiNVKHb72p27fCFEuZhAYc8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/sXA+g8KhAkG8WXQGT9asyb/da/UiyJ9OxVy8y16rOJ7fxajj2
	thirLfDmN26Vk7Oqj/QpUBYkrRPe43OZFuA0RJhugbORPQWEl/1f4IPx
X-Gm-Gg: AZFdTZeAxzkr6twrpzJZbx/xKgB9EwH5GlgSqI7Q9eYAwMcGxlQhEpFDugs9kLhAH2A
	i+xCEb9TlJXEXBnKjyJY5ip9YEmYYHGrXfJ/TIXq1KJ9YwrFf7zMlNMtyAvQc9stQDdz8ddb812
	2SCmuFdZfbZVRCto9h43i8z3EeEWncwfPjqIZOcs7YIi4bpk7dF9Ie5OvZsGFxOopWQRP5wwezI
	Vy53DCyOAQxMN2lVGlJ+2olYp1IZSNfOfIkEGGb3nf3g0YE3ZK5GL0HWSqirwnY3FY9/nQYn4Zn
	uxYyw9UH/5oFhfY9FMBx3PYdQUkkzvuXl++2sqnVPaV0NPfwLloQoKBG4c6Fwar4LK3bF2OrRMu
	wdJWv2XJMR+0MX7JwhmK3waHUdTlyC3ZyA+sGHMBFIYb9Dnf0+Bd+sYNz1xTswYIDDY6g6u15p1
	9qQ7AB6WpF9qYophLe7d9twMxPLdckwdoCEs2LJJ4t9kVMo4fjVEIBH6u5tmG6cC0b6FFxb0i0Q
	fBHF1SHvGirMF+NFxrFyWeso2F3dvj6SCANH7/3AH/YWQIDGwSmx2XNq6m6yl5upq1aBDrH/F6H
	EP7iX1AmxKO1m+V6hz9BfSJG0Q4do3M6EiNJYh8MlWUq5zuc3QtWyhpanohGY0RZ1gJuZFgdB0p
	mpG9JzJ5C1Q==
X-Received: by 2002:a17:906:7d42:b0:c4c:d6a3:f4bb with SMTP id a640c23a62f3a-c513a999e3dmr714080166b.10.1795446169636;
        Mon, 23 Nov 2026 07:02:49 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 5/5] mfd: max8907: Add restart handler
Date: Mon, 23 Nov 2026 17:02:24 +0200
Message-ID: <20261123150224.199601-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 14 ++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 5d17971a8e9ab..fe71ada77696b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,6 +184,16 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+
+	regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			   MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -243,6 +253,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..025874e5f8808 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0

