Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010873;
	b=g9han+xmxuGVP0/38wrtLJp4wnHWQ4loOOJbxnPk0k96KUJ6TCcwJb+Y8U7r5dEIQjUJ
	 w9FKy2NVIONVzREuGf0x7q6BjbtzxOx8T9xxCU/5TNDiX/PQ35WjmebN0YZqC8TGKRcdC
	 6cvZ3QYu9pGNVDgnjAUboxFuFUjv1EYoaZ/CJi5iKqtBc0LLBA2z9hUgAK4N0DrHP3Mkm
	 1D6xt+wdHketub9P4+Pq3YugpH+wODKDzB+kq94/YkJ1OV0uoZehuaeUUBsH5QoYVvoVg
	 ntUY36zW1elUqIC3Ts1zh/DF/2DxMEKJoRBSDzL66cPrbgzD/8wRXghx/Ke9dhc52nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010873;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
	b=19aL1LtLRgEDIiXW+LCl6mSKKLGjqPYj+aBVanGDIQNaxM1YVcn5bMLmYny9yUtfpocj
	 jwWCEJ+6eOOjSoDPfw9G6paWJm+XhZBd/r7DEuYwhrZPY+Tjb4KIZM4meIHRq4bKZzMpE
	 0neNBMTjE3JfjQIU0pJ7Rji9q8mWCICEfUN8p+JghPGGY4vl2DR7uZ60oZfKfYatlgWav
	 rP24QTsyHR7qKsjZrs1QFiM3YTYFOvjLd2u6khCsmc7lLG6QVKcLRhWhbcVnR2hcIwyl9
	 JlgNzdTVTPsCZ4Jvns5hyfQa9SjWX/8IM3nMjZAIwAssv4MpcagcKr4y/FguR3jzqiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tkiu5bk0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264DD606A32D
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 00:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264DD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tkiu5bk0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
	b=Tkiu5bk09yUHR1uaxZwik0Ai84WIe1t6DsgAKuMvQFYBECWQbk27DVJhBRzk2wFctvTJiM
	q2t4tNO526VcKsUI0/mxhfVSHWb6MXA/MzKo0iqH9jlhYDRCnAl7hlXZl5zyZokmMEkKsW
	OebQ4NvRyV+TN7EV3pyontATDAby1no=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-A2PvdqK-NfyZUqa1Na144w-1; Fri, 06 Nov 2026 19:21:05 -0500
X-MC-Unique: A2PvdqK-NfyZUqa1Na144w-1
X-Mimecast-MFC-AGG-ID: A2PvdqK-NfyZUqa1Na144w_1794010865
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54e98c9e752so22414851cf.2
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 16:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010865; x=1794615665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0zqBIsHWdrllFaVe3QkpbKqwXWxPxoapbaF5n2Cuj4=;
        b=RkMTINJ5w3i/A1wQnGqLO8se9wbhJgt0dgqz8cvrrVQQs+SEIYFuYiZD7wTeY75r70
         76BKKYQYZdX4vJS5DsIXlscXDOuP1egh27vErMz6z/stjk4qeLBWD4QbUzLtH4ReUjE1
         i2/kYR1Axpijl552C/um72nyn/V36KR9JK8CSqPYfccu3JtGrXIs/aTUF88gbcAxCnH4
         THsm+vX8meGsSEacjjez3EOCgdlAkzVS0u1uSGqySCvVoAltIt3DudGv6+3pEnKcXrhs
         XR11F9PSGgff+nDPN5pNkZ+nVqpGDvJ5ZlJDPww+JAbgQog9T1duRUnxwha4ZxxUxDHx
         fnSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx96j3KwwYK+UiqpdJlcL5J5rh1ypT5Qy/pBhvqTwrccw2UPrX25DkssshZz5RsQbbLIt0=@lists.linux.dev
X-Gm-Message-State: APuU4Z9C7TSOM4pSMQSuXaf68McJw/xQO5ZzjZ/ZjQVEZw/ztotRD3+6
	UzI22ghWpO1VTraPuWvhZkkSZTU5z+VpIR/xc/kfvkMBJPMroLB55yADSvrkzhmeIgk+3ifwYxm
	Peqs5xU8AC1z7aQhxv16lj65vgSMQ5FufZtaTy8Kttzh2wDH6B4Qm+Q==
X-Gm-Gg: AYBFou0yNtS7LbCvE73U6pVeygsokkUrXbO74GLIXUsvIjejMcpZocd7FhS98PeWp1I
	IJElWNkKQLbSDtLWNeI+Z+gCjjrc/dqMDi+Sq3txs7ce/GIz7syRgq4IP7++gcFf9Huud8wHhSz
	Q665av2/q58wsCxUOYWN5bBl7jBCbO/j8XNUo/L5hZPvAGqIakzrNrVeYxdMB0kVgSZGlx91kI4
	fhjaOal2nr+K0IzhdhnjKAr2MsNrIF5HhPMbbWeN8WbOjJcpcO1QVtZ0cqxsuGKLzR2q7Vuc83+
	O6zCsvVd83GorsbRYbLyU5xCWv5R+WLrsefXXRqTSDoa/oBcKxGAsOj+PCGYVzPam66eyCSvCBg
	P/4Ps05EcNW+LEma7rp9A4yn5OgboUI1rO6l+okCWorNAPtlMTCGThypzPYvWBM0mtwcxuGWOlg
	Am/8mlKRZCQXEswXaH
X-Received: by 2002:a05:622a:4d09:b0:532:c057:9564 with SMTP id d75a77b69052e-54e130945e6mr65066291cf.23.1794010865039;
        Fri, 06 Nov 2026 16:21:05 -0800 (PST)
X-Received: by 2002:a05:622a:4d09:b0:532:c057:9564 with SMTP id d75a77b69052e-54e130945e6mr65065991cf.23.1794010864646;
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:20:50 -0500
Subject: [PATCH 1/2] mfd: qcom-pm8xxx: convert to subsys_platform_driver()
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Message-Id: <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
In-Reply-To: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=An9xVkNlvQgpiky47BGz2nZjV45FIb4wx87M5kPdjww=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5b2Ie/hoyhftY5G71X/E3jU/4PFa80pGmnTM6tiGZ
 Usl+J+s7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiSdYM/zOfxlm6/Wg63azm
 GsGrP3vL11pV1si4FQtYLEWE/75j1Gb4KzA9V7TwrmzEufkBRek2vo86YroOxtkESbzOUr7zz6u
 QCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GoX0yt3NQr0NUWgNPE1Ix9rJpENf1Ebl-UfLGXj3R7w_1794010865
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/mfd/qcom-pm8xxx.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 0cf374c015ce..14de2a5e6ba6 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -594,17 +594,7 @@ static struct platform_driver pm8xxx_driver = {
 	},
 };
 
-static int __init pm8xxx_init(void)
-{
-	return platform_driver_register(&pm8xxx_driver);
-}
-subsys_initcall(pm8xxx_init);
-
-static void __exit pm8xxx_exit(void)
-{
-	platform_driver_unregister(&pm8xxx_driver);
-}
-module_exit(pm8xxx_exit);
+subsys_platform_driver(pm8xxx_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("PMIC 8xxx core driver");

-- 
2.56.0

