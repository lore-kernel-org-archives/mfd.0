Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010870;
	b=2SefeN0kxrh+WnGLz4yQExYN7u+GGRgCd38769UJ7TCcO4R1OlcR/RFIfY90xofl25qO
	 eGhgy7gu5DZP1T6DY8WDmNwYBg33hspuk02lEdeP9NmihPE/cN40is6f25IN8KadNG31f
	 viqEvFx42g4TYLAd4rca969LNzSJfUVC44+9hf8WdVmgelzkk4lEsvHrcjxK878lspW0o
	 uGFJWmEn1s2gPx4rrUi0/OSXAihkYdC0Q666JYN2vLAr5PMkrCSs7SJE/oGtJ+i/CeTFq
	 n3kmRonvYfdgw1AqNyhk+ajNvFlwu6ScryLB5CfdAo6v8MZuWyx+u7XlaYn/FWnnlww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010870;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
	b=dZ0BgZzmUHA5DFu6e1gRTa4nmEABDa+Q16F06g30eW2RN6MK1oT2/dk1nQaXLs5VFxFp
	 18WHWzBG+Xg8Dp5ttnsPxzeoJwmWNPACvXv+XpRYR17Uf1CjgGdRsdN5LBVwX4m53H/J9
	 OvH74yymBhoFFdWl6aAH8dGBunIF2x/OLj0ARhNC2XKm783NOX30HdtgpdPCxxRIN/f2b
	 V/BVIS3A0njI0FlM+MFL2Spoox6K7q81paDLEQSZIP57iIvdefXZy8eHyPAr9+C0cRp2F
	 QdQu3r67Op4wNhMmiAdc5e7iY98J4k7UxEg4o/HKl6RVR4WVbaoodspRxdrsOPLTxmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="O3Hr0/8b";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB23606A334
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 00:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB23606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O3Hr0/8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
	b=O3Hr0/8buDqATWvH7pUBomhtpmCS/qnp6s0aCw0sJ+3NoFG9A9v1MiAUGT6YjlVY6L6JNd
	vUME1nntNtPOwqsX7ZfOKGM1V6M+jgnKvDG0Jo6uSkpv6P/Vi2vQhwawtG1eZHoeQ1BGaN
	gfyoDkOx9WWbvxPyRtosxaohUABwxcI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-NU1ZpiiXMHq0kFCTXHV8Fw-1; Fri, 06 Nov 2026 19:21:07 -0500
X-MC-Unique: NU1ZpiiXMHq0kFCTXHV8Fw-1
X-Mimecast-MFC-AGG-ID: NU1ZpiiXMHq0kFCTXHV8Fw_1794010867
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5351f1b26e6so19424711cf.2
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 16:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010867; x=1794615667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRz6YjrzL+fQJI/IVucZI56kUxLtzNDsuPJEr/aWzhw=;
        b=ICdyCssIWcQssi5RDj3duMH2Z/BSIlG6PuRwWoYhHyvTK+gdj4yLz3F1ZE4m+UXVdc
         /Jzw1J+EXupyrOy8Qe163FD6IREYc/622wcHXL1Pfml6tfnFhbWGWIWYaxysjsEBg7GF
         fcMiZHUqZ0t8+O0C2ciXB2BF8NKGZ7Dx9PlGpPJdWW64+/aZVljB+hG460G5hNGLjm9/
         5Kq5Lif/KZh8ANov8Wmw17Rkwl36RUyNGFXO2MMk5dPSMCJGqp5miEVD5uP8VSaAS+kp
         AgIdbMqkq27arVgsXjixZJO2DNGvM+7ha/WRAihaQEI1oNHLZTF2bwnGvnyZG9XmnqAu
         ZvHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy53AH16o1Z4Tg0mf/jgi0s0fxGnQKOfpUi5aRXanIh6xvD8lsG76vCCpF2nX2IJJbnDvA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9hB59k1XlUYqo6OiNtWmbXOCDq9zPEBq87zl9M6aqhPpmXRRwH
	Se9Imy7kdXzzrQ848RCJZhzVWoY4QeFTLPHtanoIa7paUIOLnWQhmcA/vKbc7nafeOnjkzaoGZY
	4HkvPtELwPwM4DKKX24XbVtxTifOXTd08FRCO6MmwcTohnkZSHa6fkg==
X-Gm-Gg: AYBFou2RKs6qYIdM/gaOen0FSQqSsZP/N8JRPs3IXA2aJsQwwHpCsgCQT8eEyUp1ibX
	HWtIzw2fhLf5yLEFtFoGxK6jk5bBgBQECQ1R86TNO8BaQDhh0t+oz07t89COB/CAIeMT1uz97M3
	oFqISUCgJAurnpO4Ge2KtPeZTaS6Ozl0yG3ncfmixUckuHEysqE3Oz3RfZncZdo3sm0cWa8RfDW
	qyce/OOwKuCCSJzdNSpLtORZg2rf4P7+vGGGzKgfp0QnOgn1HVtsXE7xadpg6gLvubg7gV9o+Aq
	PEtaLYl1y3+3Yyds45DKwBR0ZcN4NyK6Ko2poJxeNV6StjK+8dstmYOPu8QOccOlyrBtJqS54Sp
	5Sbwsa/Jt8ElX2YTWxJsvQ6x5a9s0SwhpSzE0Sv50M1hNOi64wLjMX1leC4rhzNMHCyD2lFj8pI
	7pSCVi3EfN2w7xoN+d
X-Received: by 2002:a05:622a:1245:b0:535:1f5c:e489 with SMTP id d75a77b69052e-54e105045cbmr71062551cf.5.1794010866810;
        Fri, 06 Nov 2026 16:21:06 -0800 (PST)
X-Received: by 2002:a05:622a:1245:b0:535:1f5c:e489 with SMTP id d75a77b69052e-54e105045cbmr71062141cf.5.1794010866242;
        Fri, 06 Nov 2026 16:21:06 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:20:51 -0500
Subject: [PATCH 2/2] mfd: tps65911-comparator: convert to
 subsys_platform_driver()
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Message-Id: <20261106-mfd-subsys-v1-2-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
In-Reply-To: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ukJ7KafP99YfAsIJ7Y5Krw2MYdB6MwZA/beMmQx/SzY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5b2su/XsLr/Iq4VWWT9/bJvN9lqp6Lz2x8BfO5Zs6
 Vp34s/axo5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmsleGkWHvpL060r/Uz5rP
 yyuy2DPLdJLG+mUJ6g91YxZ/3vRxZx8rw//8T429XhtsmHTNf9kc2RJ1z3ZR3medLUWiRzkP7ON
 OO8sEAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vOHBZEU-XIVZ_kpvsU4QO-maWnl2kQioQM3V7M2bONc_1794010867
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mfd/tps65911-comparator.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
index cc8545a972bc..db787a4c765a 100644
--- a/drivers/mfd/tps65911-comparator.c
+++ b/drivers/mfd/tps65911-comparator.c
@@ -157,17 +157,7 @@ static struct platform_driver tps65911_comparator_driver = {
 	.remove = tps65911_comparator_remove,
 };
 
-static int __init tps65911_comparator_init(void)
-{
-	return platform_driver_register(&tps65911_comparator_driver);
-}
-subsys_initcall(tps65911_comparator_init);
-
-static void __exit tps65911_comparator_exit(void)
-{
-	platform_driver_unregister(&tps65911_comparator_driver);
-}
-module_exit(tps65911_comparator_exit);
+subsys_platform_driver(tps65911_comparator_driver);
 
 MODULE_AUTHOR("Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>");
 MODULE_DESCRIPTION("TPS65911 comparator driver");

-- 
2.56.0

