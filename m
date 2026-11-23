Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432746;
	b=XA7GFuoJ3H+8p/NmOXuCHjpejHhaCjAL4IIRFEd9Z9KMsY6/wwJ46hpDOaio75cYJi35
	 DENeZDeUj5TauPQ07HbQ5dcrhPqH2b0zygav//fvhiyXCiQfDeBFDCx6QaG2SZgvLDbaC
	 jFls1hrSmL/aG50FTPIWErWPf2SD1LOsz0X3qWGPCgOQfcJ8AIGEbmqzX7avV7YsXK556
	 PNawDeXKiKozZ4ErccXPSz5K+J48oUgB2jx5Dq8f7UKYaloUbiz0wGtWAI1HGWm6ZOatb
	 prfYt4bjeYcOCSXifaCGqXrcSFzNbT1VnM6ScyZDl2eKgzB7ZZ+N63hH3Q23YOEx5kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=k3uSf+LngMc+GclAQbDex6wYdGJF5q3WDMpqyCChbf8=;
	b=zrFYfVaFlyFoHOxTRsBeBxTTawPzmTO/E3Coi3IbNYJGL3nBQECr+nVxbTZhDGQ5ga3l
	 KpD/AAxtvq36BYxWwoYrNIKEazYikx/OY9sPS/i3mWS61ZOGYPcfPAs6uW5snnrjc/CXs
	 k3wi1NZm1eSt/tvxwOLnSbNE/1zHWatnuygwg+5W12OUQ7rxMCXT0EkdVSk4p+3q9aiuS
	 feh188gXj7Qswmn2YnmfLsyORXQejAwN0jDB6FwxunHMClwhQNvUC6G2Ytowc8/ha1EJL
	 9LAHHTS2x8BMMQb0xODJkjKu2wMqyiUx9MHZP9vocWQ59LlQ64TeEP80YaVH+es3Djw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kzaRopvZ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8465606A697
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8465606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kzaRopvZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso16899875e9.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432744; x=1796037544; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k3uSf+LngMc+GclAQbDex6wYdGJF5q3WDMpqyCChbf8=;
        b=kzaRopvZI6VPbSe71y0zSgqCSzsVS813pxupu56nl9FAm4FoaB4vyZZ5HsdaDxMjso
         6avtpjanqkgrDmuSpVNkIWPDcoVMDjD/wOoxFtJWmK0RgNqvpzP6kKwtekPifNUwITZ7
         7DES8YCkG3gE0Tx/TSo1LpLyLnBq2MmbqCDxyI9AimjK9M58B+Nl4+Q1IJdH1BfIv1zE
         sxQCpG/e236iPE8vLVH/n4exEyf1Crpa9L2eXq0rOz8gx1T7TkLqplXtmb2hAfpwnd7/
         RdNJ2/jeyDTR4NMR4aNU8kqztkfMBUmUs9oaT3yROZvNXuze1v4ijYEqfVPz7YE6rXMP
         Bt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432744; x=1796037544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3uSf+LngMc+GclAQbDex6wYdGJF5q3WDMpqyCChbf8=;
        b=WkyEERI497xxJDx7iQDKg/0JR/xd4gtUjeRE0vvdc/hPFdZghfmvdCv7juxRfakefg
         ft8IDNkgK+04jTdpRQD+hmuVct1JtVgbwQMnPtQ8SPAJ5D/bsj+HvmoxI7E2cEQzltxk
         Pwv+IsKjCfHsgnizykEWkm9EVbT4frQEL/TEyzWFOft+3/OUMgsjcgYRQ1/xnBg1YWle
         tL1L+j5CRx5+sUWQSEAb9ESXLwiUJTCZ7HTFAYm5RcV5hhhrOCsjgzMiDD9Rm6Js7GGQ
         o8hXe1IuF0bVv5yZMs+H9V4a/KfTV7WhQLMN4c7QyKS83xs16TNfQzy6phqyEs28BNRj
         qbIQ==
X-Forwarded-Encrypted: i=1; AL+hErE4c/mlf34rTvYSahIzCO6kUdAjwkAiACjFnsziSqrMG4FwAsZmPrjMRFmbVIFOLfX+GFU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/EdcMFR2+Md8zx+qmVYe6UvLgOq7CF13a7X9EoJyZ9JpB47Efy
	OsXP9HoxlyJ7iuUrTXScsH19asH9Tgnehv84fjvKbtlZedEMwbaml1aVxWnNAvbViuw=
X-Gm-Gg: AZFdTZfHi1Fyqyo1DCLCdHcAJO3lnFKrF9zI+U7dFTx7ehIZQ0WcRnniuSpSQ5qg/xT
	xg7m59IVjGM/TSqKjEON5WW1KxbBIpDkD2eWcafsW22okG5DWigH43ApfRkOVjy4O1s8CFgQ9J0
	pqBDwa5SpdGrTtTeTMQewgDe0IzEVhTgPTSaXTs5n8vFw9bGmdHVAyXVE6Ftk/OUj/8P8+o1DCu
	2KDVbmCqqJL9QiAsmhh5+pLWoF50jn5yYbTyEAFlsDFL0ennxrWSTFZroibyizbCMtV+FHOHr3x
	BWw3qgfNoIICBrkO8kgAhmxyQdYBfl8eA/aWWyegKJAHL3umUtWlGcc9utrJeGc5QYLaIGsE26g
	rs1reWjQ3qH65d+pKSExrsnsEKbiZ3IxBFGHhdkez6F4uQnhdaZJfV9T+voszHcxyQHEM8AElJ8
	AIkOqIii5HFjlC/pm8Tp3JQ7pi37GwDvLl4uvl2IJ6VNmk3OvNKY3eyq/uUlq11JTMM0J1FpKY9
	BAdz/YH080r4MBq3gICIYB7pzdgqtbmTjIHWtavPltpH7zOL9yFLjdO5TycjDA8e9VJgTlO2Pnd
	IH9JORHmDklVF8h0YSj/7Cw3k8c9Kj8M/44zklrgvjl4oOFIAF8HI2ZGh1O/IDHu+CcE6EkAf1Y
	PwkOk/17clCd6qsm/
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr261104855e9.30.1795432744004;
        Mon, 23 Nov 2026 03:19:04 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853b2437sm512008535e9.13.2026.11.23.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:03 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 04/17] mfd: lp87565: Explicitly set driver data for the generic dt compatible
Date: Mon, 23 Nov 2026 12:18:02 +0100
Message-ID:  <e2659aee5fd535a1af5bfddaf363ee4e5ce1c1b7.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=041Ou2CUmqGEP+iZWns10y5sS6irUDUF3uHGK8uBwY8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDxQ1Bh+OxORbNKyYh6miKzEokYLD2L4x8dy 0DNt+iHcbOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg8QAKCRCPgPtYfRL+ ToMwCACPUcymCoZTmzE4UKqfBqCXcu21ZylCcGbiixCoZ+Jgbnos+K7KvqG880IDBWHpCoUeWH1 +n32hQn1VrM8DDcIwE8YBxbnivVYWnhV/ukbOYsNZoy01sT4NTV2EtWoStfWGLtSrG2Ycox+QN/ HbP/5Sml7Ple5g4qbnWQDKjvbNOZagO21dFi+ff1z+HwjtUUxfcxsFqo97SkFWp70b3mdZQJxTV vIebcsGyLsxFHzhsWZb8OpaK2UQ98+zfBHcL5k+A4Ur/pACfGLdH+lLTJDkOklu1bCNQ3LlTkkz n/U3z7j92rohADNvv5SLLy5pgMq9I7fUgZiPvBfU+IBW39td
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
(i.e. NULL) for the generic device tree compatible. Make this explicit.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index 9e5059636225..08e7ab41a638 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -26,7 +26,10 @@ static const struct mfd_cell lp87565_cells[] = {
 };
 
 static const struct of_device_id of_lp87565_match_table[] = {
-	{ .compatible = "ti,lp87565", },
+	{
+		.compatible = "ti,lp87565",
+		.data = (void *)LP87565_DEVICE_TYPE_UNKNOWN,
+	},
 	{
 		.compatible = "ti,lp87524-q1",
 		.data = (void *)LP87565_DEVICE_TYPE_LP87524_Q1,
-- 
2.47.3

