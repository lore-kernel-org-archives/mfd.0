Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347758;
	b=htzZfpKE4nI9sir5mp/fOEss3KVapuGWt3n5SPg3f2/381qGiVlIb256GI/ItyUxDzIk
	 KWqc0Cb/afPp+eBC09CtlCZSYCAIuXdIgHZfxqe9AzEQ6kjMfVRJNmx7a3bGnkuzoYcQd
	 dk+IE/RFIebJWEAsJFN9Clp2Ihq4u2ZGgBDDQaF02R7lqp8IEfSC1liEf9YPwovzL04Op
	 OHoP5SwbckHrrakfBurEJAfreXIOfIylnPiiTxyQdxTDHxa9E1pKEzksiJaEA45xitm+g
	 yqeYgQV0QQreUlW6XvoL1M9KWn93FfZp59AQyCyqbk60hH7AVChCDVD8dKdDys4bayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YvMpOyVW0nmPdshmLVoyb9tIypIcw4DpcdinU28KPJM=;
	b=W1Czi4VU8bePT0gnJZY31bptftO6I1H06MXkmKhIMb1YUz3npB/PsbQcrMN9pB2wonS7
	 iUrCHMOPSu4A5JPVamNMVRpUe1+pZ8/7wiRmMeGcwIynTLnR8RL+r4MjJ1fTTvUoDLoXU
	 wdMx/vso5/4ceUjX3fu5KcOkiNIG2w5v5W/p+2m5jGiTtZmDNru4hVFER/hj/JGPzuVbN
	 uGTciRRG385xLlYxZCLLPeAneg4hCyryRiL6YNvxPw65uX6AgA+ptakcC8yP0ky24I6Mt
	 myKR0EYAOo53Tupdjjt0FEWPLjD19EsH97J7FBtap7nXDRxmWBMNFSQoM9zmBbyZGVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=auwwefSl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA89606A32E
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA89606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=auwwefSl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so25748835e9.3
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347757; x=1794952557; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YvMpOyVW0nmPdshmLVoyb9tIypIcw4DpcdinU28KPJM=;
        b=auwwefSlRtxSz/zFJO6eXT355y0+MqiGkEzcJyWQxisHbDl3ZTmDxC7KTzYtco1U01
         H7oqPG4jbCAcV7CdfsuWahCk6IdNFYPMHtjfxXebodmozGy8kDT79xf4JS3FYxXYTQta
         vU5nB3/LiARYOZXQEqfaPE4ON63lNyJhGx8zMn7X4FdXVZAYXILoB6eXmES+glqTMoxN
         kmBa92aiNYKh1YVECWzxQtS8a7GlemhXRzvO7lbjyaGVmSMiXLtcYunSHD8gqQfxe6JP
         ueE9A0Jh/9DQ1k/sjjV6t87Qm28ZPL9t92Lv+AQfDnI7H2tbZpC5NAzqRd4bUFuTgm+T
         Iqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347757; x=1794952557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvMpOyVW0nmPdshmLVoyb9tIypIcw4DpcdinU28KPJM=;
        b=dOnGceo2OatGb6ylRHEtC74ewgtiwjJmo1+UDR8c1Ig8OTPQCIkfPKtRy1m42ImPcx
         Tdo7ysezZ9HS6cfAik/JmTJTMY+oQs17ZZKxBtUeHUf93HiDOqvRWdEmJ33qiTB3QAiz
         gLkxje7YyjE/1vdKbas2Yo07zpK9O0MkvhC44T5QG23f91qfYD4CD3Z09aXE0cprbQuv
         9fOvqXU9kxxtuHM2RAiQxK+BVw/cuPbs/wkWF5MTfZPRvz+ySAjQoUDHSQ3dj35OhLJo
         4kuO/F9rSaEc9EG5AhaXSC1VCrmk4a6Jo22oNOFxHewujtOUxi4Luuk9DYR4peF/HyWA
         PxLA==
X-Gm-Message-State: APuU4Z/EZygysKzIzddTZ4jH1hni44ZDdaBXBoelfQpwN2dJdhT8LGkQ
	O/TFEIzHkWQeVNwZfuJmLLmLyJlXcy2fOew4TEXTY1Sjwc/NPcvlaxNZ1S2Krkh/O3U=
X-Gm-Gg: AYBFou23BLLAsAsK6NpRzqOY/etYX6CEpWWU8st4MpmKfX0vCJzjDc6LSMLEXdx+iV/
	EkhusiNTaak7ubgqcZouBR5uajAACewcIiTMzWkZKlzyqDQWCplGE0IKEIqmuFj6tWom6QGPq0u
	5s0D1rSCqTPZULa8l88jDyLt38+VuZLn9IBmKMGTyMlzZd/LfdUsnGrhxVjLeuWEdsJEPvM0aw8
	UNJ51wkWnfxnxbrr0e3UIpLT82cjcT8V1P6rA4R8UD5v5wRiIMTciwFHQ5Z+P2gtbNYogyLqtjY
	5RoCMBIU/BE0mQc8Pu2IBiV1tZp4nPBJpCI6KE3EZoJ/Yel0S9gO6IqFbqDq4uZCE1PxiICIUP2
	WG7EpQ/LwRcs2Q3BvgUf5s2S3Vbu67/8BMOA2P2wyGueofSnWqGx1AEAByMueO7daZNIdQ3VDVb
	gUDRU2kURM9sNpLJSDbOxDszwSYRYwWl0igUxeMeBkalqBEO0CHM6/TPgGJ/JYUNMsLkhzjFTuL
	+6L8uVzGPa1B1LknyNHT4s7bbeYOQfsPUmirUurQuNPbVwS4d9h4sVRJgaQDsh4VA+n1tesoXdi
	GD8fMXU8dxeygXKBEgt2/FWO1TEykMrbqtg=
X-Received: by 2002:a05:600c:3b01:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4ba09344911mr6417355e9.1.1794347756987;
        Tue, 10 Nov 2026 13:55:56 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fba476sm107163905e9.2.2026.11.10.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 04/20] mfd: lp87565: Explicitly set driver data for the generic dt compatible
Date: Tue, 10 Nov 2026 22:54:29 +0100
Message-ID:  <8f0bc82073121d4c2af24ef495873f486cd53631.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ItI5605JHOVUrr1auFKK2Cyt2oOdQ7yo3fgGcZk951c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KecaOWAIjbliGaieC3F/az/KAF1oOz0ppUT Cs0rvDaBquJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSngAKCRCPgPtYfRL+ Tq2eCACjSWO4t72nyZBiFE17tZkmvXuwxGTijpJde+2sKH+N+/ekSU9BoQgQSohU/SCjod5MS+o hljqIT0giS6pAajDTzfEdpWe8I8CHxgrdJSnIKZ04P9wk+qBol3vLHWQCOh8Rgf0vnDN5RwA/20 KxIsfwg5Z/YL/nhmkuZv1ZXVpD41pZu9vUwtwUeqgNa1gFkOToEvBCa7pB4pdlEBwg5Ovo7RDgv M42pICHxxChHhmt1Dd0r7esMP/aMnncsy9W1kslYHgHRfnBmQiVirBE2s6dR3hetjRWzP1LuuSA miwAv1Byb4WxVpaldyT6IkNuZdmHM5k8c0MoKOQK/B17QJNO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
(i.e. NULL) for the generic device tree compatible. Make this explicit.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index b78ae79df5fa..efea1ba82811 100644
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
2.56.0.rc1

