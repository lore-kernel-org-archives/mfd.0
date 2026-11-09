Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236324;
	b=lkG4gpYGjaiKrDh7l5/u9JxrxQSUPZDQ7Q3ft4w92P4QtsOLBHxlYS6U/JYFghsoa/z9
	 ziZITkctKR/+7K71af9t5H9gmm/OqhufFkl6Sa9HhfIbbzQqCxT7U0hW3gTgqDOe5gLfI
	 W46wGpZMGFjD0UXCEI3a3dSn+FaXbUGBajq4h4hBJd0kxuDIXDOPed8g8qWsAbeT7QwXN
	 TfGYjfKg7sTzD0LFyjwxwaugL/9gV9HKvDop/kioAfFFBofWi+OwxvjCHx17bWUCdiBJs
	 borTZykRyvwcD/HXFYTCNlOEdZPFBek30UhecvkQt9gJ3F1nGlP8vmjlKYFJyspcc3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HOe3P3bdXfzRt/rk1PMSRuU3ijfiEPXGoVY8shAg4P4=;
	b=H896bkD1DaoRANiLpURmstqkVHhnI0TdWL17OXMuYk03hzHqi/FumteMtfOeARjcG6hF
	 l3qfE5VOf5kZF/ujcz0CwUqGTFhdZeAO6BJlaTVvUkrEF6C9xyQEVa9MqRkW6Ep0MI/De
	 HmMpLBXkykKV0StzAdxPbbuN8L2ciHDMFiAtDxjTpzjGueIAT/tTrIdvq7cLGVtDVbmJ3
	 Veym1wZqbz+/g82JuJeLF06Sh2IyxtorbSzbgD+t8miAKAC1/dHslcFitlBArCBJTRl4s
	 VYnS7B8+Q6YB8Ktne4Z+c+rst5QmkVkMItqOms3lpQLo/SuH7hjxby1q9u9fJ/pUhjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4Zcbomt;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900F606A339
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3900F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4Zcbomt
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f699fe49b3so647976b6e.3
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236323; x=1794841123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOe3P3bdXfzRt/rk1PMSRuU3ijfiEPXGoVY8shAg4P4=;
        b=H4ZcbomtVvJKJLMA7jAhgk+YZI+HeGwyMoz3BWjj8iXkmXWP9JXk7DpMRPLRLCc5Wx
         VRh82FAIefaxxkLIcEFD8uJRmXviTzcnSL3FP1mQsXcjlAtaRei7sy0y9wglg09+vaCR
         rzvMjs1/iIluJ97CUnXknvMvZR4d/tOQYyqssuIILbJGMlIU9kc81FYuKUfh4vCYCjkf
         Bq8HFhwEiBKmIdCVi8lCi1+igQikTXTMx6xnrAucuNdM5YUhMaYl+Tn+bOSeoNs4x5GG
         FO2JCDS3VGiBrlnEeakcP2MjepZtuNEdJyWeQIYXP+GF7MLJsG/6H37p7URJQKxr9BTU
         lb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236323; x=1794841123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOe3P3bdXfzRt/rk1PMSRuU3ijfiEPXGoVY8shAg4P4=;
        b=C3GdyjX5Aas424taJOHfXv+A4VysLQdj3ikxf4MIZK+sHxCXG8MD3dKp0Ds7C5uoO6
         LcSiRjksWL5YCLLH51zhZKeT8CVm0i2AiDuKkNcCkCGeo9mADrYUCcV7CDhMam1TOqze
         +hUBvYWp2hZKomPN7gypnGnAZ+TOc3Tr50sN6dPBfxsaE4ukAG7HSNkUz9rPum+ovCmz
         WkRorai85Qe+58ewS2PAgTO66dz+3hm/OBIXwkanEQTp2lBjYg4iqaSEg6obL7hWDCvM
         shVoG0/PHPA6d2EZalQuePXT8E78RWJTWg+r6tjjGvAkZ5g3sXiYQfmgpB+pzpL2qrsA
         deow==
X-Gm-Message-State: APuU4Z/NZauVrDS5ZKl1/BNFdCR+pHOWM4V5ORN7T+yjJRXLHyHDUq+c
	h8RskWFfiurMf3Fft4c2z6bqSDr8shDHUi7Xsgt6DrGYOSE4NN/o1JEX
X-Gm-Gg: AYBFou0D0ndvmCQ9ul0HWKqj+SAY1E70S9CVCqAs94C0lmdTReuQ2kIemLCPFDdNAZy
	zXy0Xfr3H6je0HFq911AXnm0HbGIHS2o4Hev92oMI6BfRW3+xzjWPLgXwpHG774t331ARIm0R2c
	s9Inm8XWlsvtpdbRGmUXudMUrkZYD6ipSDsfvvwHbWquVxS/9E2kW2YTcTogAyso2QLko3it4wG
	7MdrGuTpA2Yb7AEu/6oAEpsNC+oD0HKHSe1hp97gBbaH1gJ8O8ogtlhhzD/rM3oaR8dHN+BGNtT
	RQ0o2bwUsLdcKxk57JFSr0TW6LyJvvMS4jVVJMq1Rx0rmFDDp7sR+RitV01NLGfqiO48ElJybIk
	qvw0mC+M96rUDBlKqEyI3845Vq10lJyXclPl4r7uF86ymPozbPlgdod5o9VPSGkisvhB9HQ9Cfw
	/i+pscKGQAgNJf8ZjGeWzfqk6r4/zk1YvJJv1HXdbr6rKMpSHX7Jd0d3MDyCOlLolfGkNMM1QQG
	LO6H657S0hGLGFjgOod/j4PSNoFf9FCOGy0lplBitXq4iIdi6AH0pKTxOVVpYY+QI1rQpWMN78y
	3tvVDN2yb8XnF0E1dfAcLtUQe+wvxA==
X-Received: by 2002:a05:6808:3c48:b0:540:5827:6d8a with SMTP id 5614622812f47-5681442f9aamr2752959b6e.66.1794236323292;
        Mon, 09 Nov 2026 06:58:43 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:42 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Jacob Cook <jacobmcook1984@gmail.com>
Subject: [PATCH V3 5/7] power: supply: rk817-charger: Expose boot voltage and OCV values
Date: Mon,  9 Nov 2026 08:58:31 -0600
Message-ID: <20261109145833.1363319-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109145833.1363319-1-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Expose PWRON_VOL as POWER_SUPPLY_PROP_VOLTAGE_BOOT and the current
rested pair as POWER_SUPPLY_PROP_VOLTAGE_OCV. The OCV value will
return -ENODATA while the battery is not resting.

Co-developed-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index fe2c949ac5a5..ede89d84ab0e 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -565,6 +565,14 @@ static int rk817_bat_get_prop(struct power_supply *ps,
 	case POWER_SUPPLY_PROP_VOLTAGE_AVG:
 		val->intval = charger->volt_avg_uv;
 		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_BOOT:
+		val->intval = charger->boot_voltage_uv;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_OCV:
+		if (!charger->relax_voltage_uv)
+			return -ENODATA;
+		val->intval = charger->relax_voltage_uv;
+		break;
 	case POWER_SUPPLY_PROP_CURRENT_AVG:
 		val->intval = charger->cur_avg_ua;
 		break;
@@ -703,6 +711,8 @@ static enum power_supply_property rk817_bat_props[] = {
 	POWER_SUPPLY_PROP_CHARGE_NOW,
 	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX,
 	POWER_SUPPLY_PROP_VOLTAGE_AVG,
+	POWER_SUPPLY_PROP_VOLTAGE_BOOT,
+	POWER_SUPPLY_PROP_VOLTAGE_OCV,
 	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX,
 	POWER_SUPPLY_PROP_CURRENT_AVG,
 	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
-- 
2.53.0

