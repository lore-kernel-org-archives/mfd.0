Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446468;
	b=J/j4NeWcDCeQwPgRhLZujCTudwtJQS7RSlv9m/4eeh0xRJki0y0K0hGeoVbMZAKmDLjl
	 3EwtdymMgXZxJaBFgbDz8qSPj76iyyaPMLgrsEV+k1RIhhVjB60DEGT/plPepIcUcSTNt
	 ZYvslZjocxOoELHSGgLlHGNND3oKvSY0zEZqEPeuShNAFWWqdxSd+Fk8SuEV6+jpwgQ7t
	 17Zu9QNftGVi1nJzDzcrlMJgiaqp03la8kTrbNbz0X8V2QEYT3LRtuRwtjICIMuaQW7u8
	 2gLUtXyT5ubl8wrWF5YTpY5IJ71+DHENKqCayTucsKViFGHdhikGj1eVC2ulQjjDZyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
	b=y/v1prdeApe3n0kWGi4xxp43vvX/wFNU34j4PTZ+1M3YIdQkSV8P4w1Dodl+k+6e446h
	 GM92wvjPaHEpQS5wJpyPT3EBR7geikaTys1ctSEFNTYSfgQwkANAyx0zZuwibkY7JBQ8Z
	 27pdl2xAj1nTPi0oLcQowbLODUaj5tZzRrCMQP5wODXe+SubfP++83ff4cnrPMvsAxgK1
	 wXcfoniHhbWRWW/7/YacgHrPFvCpxLQysCkZsaWeg7x2vJ2965yjG6c45H4eElncbUtZi
	 LXNy2NhMLJI6Tt3LXOFSmaZJWrR5Q4kExBj9RUuNIeXX4OgFo1TYSYX6xCDzWF/aYgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdgje7Sk;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84966606A31F
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84966606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdgje7Sk
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so4360141a12.2
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446466; x=1796051266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=kdgje7SkrfWgGUcBnEKEXsIki1u/nMK9OJ3H6asBDpf7kOY2RjpSkZJ6U27J4plSH/
         xoOlIkGUtj3wEl3T7Gf+9yhlXG/8v7Sh3qUp4Bn+aGobxn9ArUsad37ImZBbpGy3MYoP
         Y/asu/I/nRllo0+OCXYT7CCh099g07Zc79b7eNtrsq8gPl6oXqNQuyc4hzCdg20diJoJ
         S6Jgw1y2abCgjQXzEdcTU5KMAg5xLXxg8eDhOluA+j/afwa6JUv1odqS3CCADWoyLHG7
         mZYZuxUexHewNCpFMEU7iGz1H2Fq2EpaBIgilD9sS8Ap9WMm+BVrFtsIyW0M0XcmgANV
         +3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446466; x=1796051266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=k6Uu4+gIvfcolrVGumE2Zn/UBrmebvZr+zFKXpVh3PDmp8UnJVLZFdkKZ/8TONrinT
         6rV6WZKgspFHb+RE8ALCtK2msDG8uAZp5sK/72DOeIWgFUqwTaKvYCsNNI10R6JnXnz+
         Lc9+GC2HHMyo2mR6SZe+GYAXHUdPiX2tC3k3Z8qHPJh450puS2YWNBCpQoOLa6TsR1TH
         5rYz/n3knr0JhgJfDrYeAcYRVDNDgUyrqAlJm66XlFW2nS0pjEWZcppsn8t6966uVXR6
         A/HATuuoxN8XmnlJ2d4F4227472vzZYMuB5t9pf7UVZol5q0EA9orKzDjXtcJbD+VuCP
         R0dA==
X-Forwarded-Encrypted: i=1; AL+hErE/VQSRgn0X5Qw8TJk4SLivAZ/kkJH2HRCyEtQ03+WSelR0MnZcVsjQB/qDl4HciNl0sas=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ouuy3wS7XtFmx6BM1g3cmuhClfc6GH5lHv9DgjciLOgBKwgrP
	e2oexH3w1ytSq019dgkJiWaOUApE9UTDpp46KukPkGgmcHGCr7aN6nvB
X-Gm-Gg: AZFdTZdTEzxyr/30VzuAePClW7IfMxi9D7JRqLacxNmwSRJ9a1drAX7HF8Gu70PJyXe
	Jsn4vKWPRa5amTvDMPFUZWXf3kHotjP/z2IXuCXaLzexR45FJ5Py43gIlV3omv0GSlNoQx8qVMn
	8/LpV8XjeAIkKXq2h+zGodnc5w/e/atvrTI7C3wrBsCbzLCVAwVsRDaTj//eg3N/PHHMvpGZllj
	QJOTtsaI7C7rhzeAt2hLwo3TYup22StLTcewdMYfEiLcrwIoj0JjILcb04By2rieOVRnBZFJDlZ
	0zxo3HGkoOWrS2IsWQjwsnTbG9EcYCYOEQGTkKOjLNfssj+wPCZEHTkPZTrptfbe/oy895F+HXu
	d6HGelSNxBOpN3hwed3dw06eL9BMVuBOFGG4GZPZhMp33EBkCLZoIBvlBlSy1UFJqgjgEEiGPpn
	V6MJg4TADFAo0OxHNaP9ab7J5LFSRAfpmVTvLyx92Rl84mB9siamf2C/b1eTkn8pxwl2tk74tav
	2StGmVj1R8T5caZa/H4SdFCOyCUzyU2FxjDbRh/ylOiaohShA5Hz/bcsFcGGpxegDS5RjECHfzU
	AatfpQh2wZ4jdqKOV5jf3wkaOSekLOqoc/UtALNCOEoKy5baAynePb/EyQHubdZgKQq7pgO3Zxj
	cdVox9+APGg==
X-Received: by 2002:aa7:d789:0:b0:6b7:6c8:70d5 with SMTP id 4fb4d7f45d1cf-6ba37c76e5bmr5952130a12.3.1795446465996;
        Mon, 23 Nov 2026 07:07:45 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 4/4] mfd: max8907: Add ADC cell
Date: Mon, 23 Nov 2026 17:07:25 +0200
Message-ID: <20261123150725.212836-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150725.212836-1-clamor95@gmail.com>
References: <20261123150725.212836-1-clamor95@gmail.com>
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

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 103294c76b97d..ac7b41ad400ed 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

