Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D0D513573
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059830; cv=none; b=X2rTgRiRJYOyr16YtlH71MGp4Eeewi5MqnDGuL7MDuI5LcA2Kv2z2KbO2Nhz8ph9QypWfpH+G2dJKzBwY/21NXwe0cVLMkO14mqb6LeDUbLRyZRLIN85DmJIS30RIN+M0QZeUogWq3vIKPav3Wt1UQBzNeIWg7doRTt4hGGOnNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059830; c=relaxed/simple;
	bh=nSmXuMKhoIgAobqpkzs+VXQaRMleH57PzdSWjcWc2zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPgjGhQng4+yIm3ervWMTawK4ObbEajuHKfW/xgRT6RHDzwIzLNetD8VC85CZkCe1IIdlwVnbwNolyR/FJ0eDQo61RqY1T1GR2jjkxokMZ6I51dfRhj9pcmYJTugMzdMFi2YCcADRZUrOt8OhXpDhYlw5BIcxQ203vF1Y5dfBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpgAEbkL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpgAEbkL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so728641f8f.0
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059826; x=1792664626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HteFBMsv61wMUi+iQYixSn1H5G1GsfDrtUwr2aL1cHg=;
        b=hpgAEbkLsiLSpQQ5GaWkPnaxVD0B0KisLu0px2KqplcN2qwLwoQK/cE7vLGdZT/k7B
         gJRrafYeH0eAmcoSMeCxIfPsFXSRsrG+Y+i1dOzOH6PbiVPbQY7HWeJEqubSpAvQRaE+
         oJR0f52CheBm/bXRXh+30/cK1NhLevMmcVVgJ7QyRkM+uMGbjxpr+PwotoO+wlJrp3PN
         wdi61PazfHNJvS4/WWpGui6cd80JLw+n1iP2wRX/42k356V8+2/fOc1UMojRpN/VVUB4
         JfMFmLOqSIun8wXfsxM5iQaGCy745kct/hBW5WNJHiZcauUXX63MvQo2KdYCW0viSuMb
         mL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059826; x=1792664626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HteFBMsv61wMUi+iQYixSn1H5G1GsfDrtUwr2aL1cHg=;
        b=bwmo+K2QyCOzeDv0uOSNzBF1Ed12tN9Mea9TKCSFvY/wEjdu70AUy4XR3v7BLyCZbw
         L1vSE3DaMjfPDcaoQv6sEu9wRVk8lDZ+uLLmMPY49RS8xxSKURcSRSSBPXYHLngrrED1
         N8BRXV+vDdxICqTdK677WWRwAsHR4YcmYnJH1QfcB7RG81/qNmvZAxXzZE/iTN/PYL/m
         0C1nyskFyaOAAgt9KZIwW/r/Hyq10xzZLDcf/2FfUdH6fJukDjpCwa8pTAzOETR7+/We
         MT/Gn7molf8/bgoIDFK+ZbYbrc5F9D3rZoTwgeWR2HGNzMKLpepQlY8TNyuZ2ueTuDWL
         FSfg==
X-Forwarded-Encrypted: i=1; AKwUvByalQXRF/K+s28vSe0ltPPuUlbEjMUQ5MRjIHUgljky+kfkk2X5hNGQvsOeq1TCVW99EyU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLj+Q24G8luYwNUhyBvQUsQq+8LXP0GJsTQJMVJePMh1eVgitIX
	6hefgAIslssy+K/Ptmeczr/BzaqFaueWtZi5Nb5n5M9lvPqtsUaTqhZz
X-Gm-Gg: AYBFou1TUgyIlspslcis/DbLLKdoXy8ki7y8nACFAjhLYzR+paKsIXHJ9WMSHFBIAGp
	CPI2a7UKB0byH94SfSHbxED7bPxH0xbMEArolJnF3LnUDkCCsYFveatmQM1nPNxM1aumx80OWTZ
	UJYW9lIE9V66v0B9EYjTNh2FAQ4/Kw8YmT747UL2Ath8W9qX1BBMV42FYzgxpFDRVjftZi7okje
	cbGw5OVovACBcVu79JTtHUw2FElEqBssw1MoZydZjq+cxQP3BnS4ZQTkgUtIGnhlCkbfe69PLyJ
	MDOK2DQs/crowe6IIeDYdx24oBwbCR2PupJwf+Mlj0dBvimI1JqbEbqVOl5lDvhUjlidCLdYKyp
	e/kjHJcgu/0hSTluYl9mkreKMvSQrGdShf85HVZ+a2UB3dKIo6bM5ghw+GG4uje8ULS+Ovhe7U0
	7IulMfQ3HS0pX8HhN30np0QWTqYoLXqGhnKvsSlOIauRmNPElg3UekcYUhb9WwBqV0sJwlLluGn
	LUSDsRxXi3CfAMnRhc=
X-Received: by 2002:adf:e005:0:20b0:48b:437:8fbb with SMTP id ffacd0b85a97d-48db948204amr27843290f8f.19.1792059826507;
        Thu, 15 Oct 2026 03:23:46 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm14952542f8f.32.2026.10.15.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:23:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] mfd: tps65910: Add restart handler
Date: Thu, 15 Oct 2026 13:23:20 +0300
Message-ID: <20261015102320.23760-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102320.23760-1-clamor95@gmail.com>
References: <20261015102320.23760-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <digetx@gmail.com>

Add restart handler to reset hardware properly on system reboot.

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # ASUS TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/tps65910.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 18b76359046b8..a1734fee1485a 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -440,6 +440,20 @@ static int tps65910_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int tps65910_restart(struct sys_off_data *data)
+{
+	struct i2c_client *tps65910_i2c_client = data->cb_data;
+	struct tps65910 *tps65910;
+
+	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
+
+	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
+			   DEVCTRL_DEV_OFF_RST_MASK | DEVCTRL_DEV_ON_MASK,
+			   DEVCTRL_DEV_OFF_RST_MASK);
+
+	return NOTIFY_DONE;
+}
+
 static int tps65910_i2c_probe(struct i2c_client *i2c)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
@@ -525,6 +539,14 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 				"failed to register power-off handler: %d\n", ret);
 			return ret;
 		}
+
+		ret = devm_register_restart_handler(&i2c->dev,
+						    tps65910_restart, i2c);
+		if (ret) {
+			dev_err(&i2c->dev,
+				"failed to register restart handler: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = devm_mfd_add_devices(tps65910->dev, -1,
-- 
2.53.0

