Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869299;
	b=qP9aYEpZMzZuShQ5TOV9klbsJSyu4UZx8253KH9nfW9kRT4LJPt7ZYR2zHfrV+A2s396
	 VmoD+r0VUp03M+oKfesmPo+2cpxcbYy+i7ktgrJayzB9qvXyy7PzVsM+xKUAXHlDyyKXO
	 aiAdpI5FcVQtki2xN4pO5MTQG5Sq0/XSYKqKb2BVD/jfxtlBsv0w1qcdE8DrXnGSS+MeK
	 IisolGOt6qe/206tQy3euUescoqKkw7pozoUgOeE/AfjacnxRFJbQ/55w2eMhsdfdE05C
	 G4ksy6KMZCxhAwkz2GrNOrPa15fYYBpYfcBi6jMU7zXLxqFE1EQ2U6Ve/8rXEpJbj7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
	b=alMxkZqDQXokFls7XzMNO8VwYOoh7ztbt9MgYEoBes6IFIfej0H7lapl5hebjbH3LN69
	 bmiDzqEbkZiChLSicXiwFPZaOtDPrD026+sEBwSzGuXNQtJT503A6Ak3p+pcXmoAyjqm2
	 IMOyJ/+dFk+eZYs4xWycjYYybZwLvz1AoWMtcFHeJZxvLcMF7dow6VvuUqiXupdMFnR9x
	 nEzUBLuMoeTbf4Gca5LvRrQhSyYdDAgLCwbtxw5ThS7SDEzXeePmfLFTQWS/n3MY/ZDo3
	 BEgn4nW4SISYIvERKMILi5n3UtY+UZ8Do7THh0JYpxaUqXeg2ajAETufFYmPYobMGqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vgq1tgXv;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19428606A330
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 22:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19428606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vgq1tgXv
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67db8985419so2427236d50.1
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 14:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869298; x=1795474098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
        b=Vgq1tgXvVTYlVxNlpd8JHP60+TCQNIhZAR7/Qie4z5jQUxaIf/Sss0JmyoPnqawK8Q
         bA+igC2pr+gJ1ZcVsdeGxkQ8If6VpVC6BEhUCMlico+lyQzchcpGAyAHlxN8Yvr8by4X
         +iWrNJEhjmWrC/WW8sWgc/MJDLTrbdg0D1/re+HfDU0yhXV5ageBTZHMKfXDzhU3eADz
         eVu6MgUx5VMQvUQSZDP8SUQlai0sFb2Zr1D0PVZETR/tVRh3w5YLTiWrke0k+5UC3mSE
         51HVOXV/36CdRRPU0QHaXWNDCURvd4EqOCzOolV+rKw9B5LaZKKTvaKgCNQbM6cBJXDa
         +Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869298; x=1795474098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oh/bkFp2nuSyz5ivDEaIwr2GT3sFP3wzg1ta0b9US0w=;
        b=EPEgO+zMJhF7o5RM+8do5rihrJAkmdIUA5uE3r/bhpXGK3DUoVZ9h5mD2Ce8Q+U2os
         udbs1CrcrODJRn8aWA7KbQ1/ZDs3YdI2OqquKgVhWG/mO4zKcmuERS+1zAXovrhOseri
         Oo8XJw47SNRIPV2HTPbEfkaKyA1WXcoZy/ciBIBCLUhuWvlf5ARG1rmKYrstWWso7v3P
         2SsBEBrQXG0+5Rw6WmFSIep5pNIau1/t94ry7NVSZImcoIf4VPTo8HUtjkY3ph2T03hM
         dkIrNxdM0P9E0X9vsuaIbaZIJHGQFhCb8Ex5cZQYNZKibfVwa4OeNQLu3HpW+XP8Iwbo
         AIUQ==
X-Forwarded-Encrypted: i=1; AL+hErHEqBPy+pJUQ4qxX48WIw6tgYn8DKccYxhH7CYvd4RBTymwF63JR4MVOh3EKRw46NMNmlQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/bQNuvRDos+6xYMcVrVm0NuEnKibXVUPHSv77OOthyDknZubsi
	7P9lNJnm85yo0zqj8h+BnEwmJqqkCV87JqH92xtAJ7zHLPIGmO57vxLi
X-Gm-Gg: AZFdTZc6a8NrqP7JA+2jZ06E+5z7yQihelzywACVS/+oZE15foDOQE7whMS1A4KoJGI
	hNpXPh3maji5n3jIKpRcjDfng0V+XebATXwmpZYAJBsxXJhPXSeNzzc8b1aAzfUYmlUUkkUNiMP
	VYA+4O90fuzRZpk3WLJfAAVnTzB4nxWqoGYSGCio2iHg5vLus85LcEeyPnPv+9wVl4zr0X5w3rB
	gZ3gyhE4+5drMQlKtqXFMeZVrh8As978quvqJXn1t3tp1jb0/dwWG96DdKDfGicbDFlA6+bq6qp
	LNSA58NPBlA5BThpczB9KxESTveWrzZJacmcl+5OosUlMqe+Oo2Xxj3vVU/a5ZnWWp4qeDfvMwG
	NQ9ixJ2kOr5BDdCJ/jJv9cF7j/DLJ82Wn6dbFyO6pVYmajBj/CuBRARgeOWjg7tngxVqe9Cdt5/
	EfI2c3ynUdYoegpHuHm+vjAiIcVcdTlt2mIHkV3dt+EEdNWyNbeIAyb3let3qi9O/zOvdCVxGmj
	Pc4kJa/iTDOTu4SU28yUCCzbOVrkku6AkiGqIrKAwzpuFlSEAXsiV9mVvccaxVqhwY2eshhonEs
	5PKor+5g5cHpeg32geREufizqP69FXmDCUL3SEqG30XGaVXhZu3GYtroONAjHSIUbDpUORzCNnO
	/ciTNfSs8eXqvPibOWBXbCzU=
X-Received: by 2002:a05:690e:a49:b0:67d:a8db:2821 with SMTP id 956f58d0204a3-67da8db2967mr3475909d50.103.1794869297941;
        Mon, 16 Nov 2026 14:48:17 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:e1c3:da60:db44:d0c8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67db0361f39sm5259534d50.19.2026.11.16.14.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:48:17 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free on removal
Date: Mon, 16 Nov 2026 19:48:01 -0300
Message-ID: <20261116224803.61154-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116224803.61154-1-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
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

The LRADC trigger is devm-allocated against the IIO device, but it is
manually unregistered after iio_device_unregister(). The latter deletes
the IIO device and releases its managed resources, freeing the trigger
before mxs_lradc_adc_trigger_remove() accesses it.

Since commit 699fb50d9903 ("drivers: base: Free devm resources when
unregistering a device"), device_del() releases managed resources.
Consequently, iio_device_unregister() drops the trigger's allocation
reference before the driver unregisters it.

On an i.MX28 EVK with KASAN enabled, unbinding the LRADC parent with:

  echo 80050000.lradc > /sys/bus/platform/drivers/mxs-lradc/unbind

reports a slab-use-after-free in device_release_driver_internal().

Allocate the managed trigger against the platform device instead. This
matches the trigger device's parent and keeps the allocation alive until
the platform driver's remove callback has unregistered the trigger.

Cc: stable@vger.kernel.org
Fixes: 699fb50d9903 ("drivers: base: Free devm resources when unregistering a device")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v3:
- Newly introduced. After Sashiko's feedback in v3:
https://sashiko.dev/#/patchset/20261110141934.42490-1-festevam@gmail.com?part=2
I ran KASAN and spotted this new issue.

 drivers/iio/adc/mxs-lradc-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index dda5182a5076..64dd3a9995ff 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -454,7 +454,7 @@ static int mxs_lradc_adc_trigger_init(struct iio_dev *iio)
 	struct iio_trigger *trig;
 	struct mxs_lradc_adc *adc = iio_priv(iio);
 
-	trig = devm_iio_trigger_alloc(&iio->dev, "%s-dev%i", iio->name,
+	trig = devm_iio_trigger_alloc(adc->dev, "%s-dev%i", iio->name,
 				      iio_device_id(iio));
 	if (!trig)
 		return -ENOMEM;
-- 
2.43.0

