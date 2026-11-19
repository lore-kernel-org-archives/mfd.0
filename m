Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095664;
	b=3RFMfp0FCiHj839PIArS9sO2BssESPSRO80TEjfWiOMpONcoZ7HezLr/Hb5ZJEjHHqtQ
	 aPlUYAOA0SL8avtBx1VFbi3xz1+w5Rf4XWuJZ7uYPo3tCk1tLVejoq8EHVTL0xhh49XH/
	 J2c1dVTO77eDUVCgYhCyw3e5cKq3dIZXIv775Fn4l/Hwaf4o9Pxdaf0O9wg2laNKFSKWZ
	 AqPsc8LSIqjcmK5FW3zTwjM5s19JmWtmtl8CeqjFB6VEeOoyNFJOtnd670zz/kkpJgp5Y
	 Nsf+oQtJBBf6tT1o3vwG8OASiP3ef1o6Ci7n9bRQi4BnhG+kAzsQmmeN+ehshvUL70A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
	b=hIvKe12z06Kv+GThnKJqDyVrd6RmzUi1ADvZv2Um89Bs928XsuAIjaCUFRzKVNDn715t
	 fRztq24DRwf0JfE8RXj4qkD2PUw9q4F8kVMUKu8YIWAGeo2TWKUTfgAr9IfGavT1EWLZ3
	 ObBrtvw1cXjJWYb2La0AXUdTcuVXtqUpwuFsNQN1NJmKCHeV95NK8rZXbICbgRWmftJgk
	 1hy2ZsJhPonGixzfFfwLfHPMm4+d2QZe13bZ7JYms5I8g1nmZJlc/J99kZwLfOfvt0Mub
	 wveATyaoOjX11YTTK7zG2M2JhsnXcutS9t7zm6V3ePPzY/1iIevHmoE2pP8R+2M9+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=smnXGyMl;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7B9606A338
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7B9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=smnXGyMl
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso540943241.2
        for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 05:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095663; x=1795700463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
        b=smnXGyMlcvxkLan6yIn2xAk3kH5yd+r/Li2ul/T060AfrL6lDM8wD6HAu+hwGQmZ4R
         lup97KScseNHJrO1B82UmrfdJyILoCw7tiBxRAw5ee25gZJNJrhHZMQDxV21m0lO/dNW
         e1XFVt3lm6hqIJF4sfUYWT9/Gb4Pl2q27ATBjOxdq1xfZsayxqDkD67Hd5zRka4/6xRk
         iEtwOuE7f++vLHtlIu+sEVWUBnpSBbNwh2gRtbHOzl/heXvTYv64H0Mhxm3JVSNLYQsz
         DdJP6fnKkJAn512KbJvquZ3pgnsDQB1zHKajB8/pBhPFZLSHChzVnT53Fa5hZapEy/+s
         AYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095663; x=1795700463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhjd7qCe3jh9JBU7wRsKPF670mA/VW55TzY1RTvEnYI=;
        b=R/pRp4BRjQ3nlU8SOKDIHH+KAC2TPrwrh+S5o0qScsaW6BAEJU+If5rrMY2BP7KaBS
         QgwgiBTQHM9U+2rxdBuXNzL8ym+pKBIsENgq7pJmvXaI8qTfDgyPafeEek/V51UNVpKw
         6dENhExqCyGvWklqkOCFeq2YIxCfun9Rb3EwccPhsNQc0yjnLtay6kRADNqAUj6SnaV+
         e0BE5ajTjsATj9xp40LT0hzrMgs2Yju47V9HBgprd+TLCzjmnbY4Txp5jDscVs8EDLSN
         4OeD4+lT1z2hqhp/75FTVb/L4+8eaEc577LvqKAdrBliGZQSFM2QdDNCaOWGb8ThKBi+
         I9Sg==
X-Forwarded-Encrypted: i=1; AL+hErE92V2A3AnPnryy95NKg4KBRG96i6tIE5mJ/zpIj3gCBUNvDCt2FND8Tu1ph2NnYBknmKs=@lists.linux.dev
X-Gm-Message-State: APuU4Z8XMpb7JurNXqDQ1N5/eeqKdm+nT4SY74Wz0TSpgePacxywOCOf
	nMVXRCkSHOnyAnrE+t/yNU8FxwhCJ99F9ODCM2U9D5iJaPlcD38j6rh7
X-Gm-Gg: AYBFou0y6pRfdLbNVeYKuAuakhlA8UgVazwYexWS3Qbmgx1jvbqKqJrGJ5Wcg1CQjYL
	DPpgkwhsaxKNxByc+HZxQCRrtRohh9ApbHz9AH8zPgH2NC4HI8k9FBpe0O1CGInbteoXgoPkK/L
	WTXqGxZhpabWyOH3MSmfzjPUONnc3OEP/DuPoKotN6VJftA+Vkp0ld99uXvHyUUKseZYc5LWrvx
	5RohEeY1xEcExEOghyGb5iSA7gnNdRMfw83uII4a2RaekY0tbowi/5GrYXvyUhlelJwRIkY/T5i
	kAuh8bznAhj10o/q0asZU/qDaRsk6aw4HsBzt5gg/2z61oJ6NXHD4aU8H9LJgFePbASpPn4OED2
	E7yiY0zzplgxCsRyNFVJTRTXfjW6gjzXlijMxvWpGKDUhTwR/nSExqIwplE1Lem7JrhEvO45Lw3
	0anENlXfYl3wmEZEeR4HcvRkoKFEXA4Oc2gkvPvhklwO0YK6btzh5T+zaPAAj3hWkl/1lXb2284
	PUx4xnyg0LVY4umLkd/N2jHK6tqCjwFeetxpJGaX44d9o41bWY7GPW+/tVZc4IG40SuszBsrccU
	QdlOwnBFKn8A7/A3+4XWQTRW9HDdLvRuyKMGL0XLiHXp19HKYhc05K6ZSgXdcQVEsDNOzDweZu/
	DbWZtbpHq9vzAvIPVv64=
X-Received: by 2002:a05:6102:54a8:b0:7d0:6db8:dc3d with SMTP id ada2fe7eead31-7d6ba191168mr2215348137.5.1795095662707;
        Thu, 19 Nov 2026 05:41:02 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:02 -0800 (PST)
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
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free on removal
Date: Thu, 19 Nov 2026 10:40:39 -0300
Message-ID: <20261119134041.16611-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134041.16611-1-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
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
Reviewed-by: Joshua Crofts <crofts@kernel.org>
---
Changes since v4:
- None. Only collected Joshua's tag.

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

