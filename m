Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010869;
	b=Iz6Bdc+5KbgdVpxcbDHU5wt1gaBQlrSBG7JL663pjeLFN8vCYsp9byXQrddXHF55jFbL
	 tVBSMEA35wfQ2UgSOEd0XbG9DRwGBD2m1dYp/AlUNksuYksq4YRXBgGCvaV9ggQvxn4Ks
	 TocvtYisl898iLSFc5f4RpBLEpXETVDWJmRsx7bIwo4b21dBRHpzGcwd5vqv/d51s/5Nd
	 hMMGPfXhIwxh3SZLy6QIgk8WiInEULXWB3CK+LLZ+M91sTX2Rzdv4E2A7r4ATv6mi4iT/
	 U5K+hF4fwIvwsB6nLYJdDlk9LZt9VWjCptlwiTOuS57yNJwTNEWyNPC+wC8abWOUK2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
	b=Pz4qkMKBI2BOKuX8cgwrcDfswhOj8CdZf/K6UBYBSSl/+Gh4mKSUfRKx3Cq4YzqKN9qp
	 XFKACEYdrUryVFZQD0FJWe9CF4iF3r3iqVTlf54U3PkolJgWbQEvFDKWt8e8E+XNR3xHJ
	 2k8lDohbKC+m31owHuJo33mvoJ1ISjBhuxU0SnYMxI4+DSRCQglW0UthGcXXMZzS6q/1V
	 pm/6yjxXwHiqbRy/EHiSHiSGjZTXfLfgmxPsyL6YmyXGf0W5STfHOeBjhFLkpHMJqAfd4
	 hupCfADTE+xWikyk8NJZkUemVlwwyoCzZwYWyir1TkaTL5XpKNFjxHifRMoLv7Y3BFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jf9GISnB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A939606A330
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 00:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A939606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jf9GISnB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
	b=Jf9GISnBZ0wONKY2iaOs9SlIUDHitNSluS1ZaHWFlZL6MhuIR1isPyj1WkPkMoNRgW4vik
	rPWWiZ5COuCOQY8G7jejZGByOsfI6D6S00cpk+h/JGp0nGowQpaOSMWZA0DpMTXC88bwKm
	MSWuRJHegoeoF7da4bEJCXv257TrgVQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-sNAXJQlTNSmiyXm0bhbbHw-1; Fri, 06 Nov 2026 19:21:04 -0500
X-MC-Unique: sNAXJQlTNSmiyXm0bhbbHw-1
X-Mimecast-MFC-AGG-ID: sNAXJQlTNSmiyXm0bhbbHw_1794010863
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53661e036a2so23751901cf.1
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 16:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010863; x=1794615663;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
        b=l0d6SvpiX2CufgHNZUkPob24tyYQCBhNJIhMaxNgyjI92tOgP6KO2TGkQ/sZvR8aH2
         fUYt48V8bna+9qSAgFZqgiEpxs50HC7oj2OdvJAAlMBU7QFzC4mIIr57hd4hMu9wII2W
         Uf6m/be0ZqURb/irJf8biMkXRTtPTmqnKUcn1/GJMdhMR6Rc8nWcmixGzJ/9n7dJsYcg
         UtMNM1RQ/MNwRyJdKH8y7tRWn4R0go/zWvlT1cmEZowUtOz3oidMLu3WrZji++vjWFgB
         SeIaLE4bpeIse47ATAs2MhQriFos34DkuK3Ev6UJT6bX4TddBzYZ8XAVZEveHmaMibS/
         cWag==
X-Forwarded-Encrypted: i=1; AKwUvBxnSePIDUOMMWF1ZyGRSKPwlRVyyMO9VWv18hrQx8wiFUnlYHzYgXdEgXxh3SLzk1VtwKU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9TD3CmRcki3LSO3Vj6LcCCqiJrnYRBGNpRFuv7+RAoTCgIVa2R
	bcM3NUkTaVj87YqxWGV+06ya/vaCKqAofsNeuQr/YL2bt6HyocILamUAHW0WShQIRuKAVKi66s/
	gJT8zIxT5RLjdii+z0MDUjOlh0Chk3+OmJg0HPQSC/RxgDeVzuBUf34blK8HN3g==
X-Gm-Gg: AYBFou09BS7RKIgu87rTxs8+SiASJZ3EFgxkpfzFaDMWshRNHYZspWMQy978DmpkD7+
	DVHqf/g/VOb8nXEwbUmPFcniHEOFt9GJHM763dTE0l31RqNUDXZvEzeHBvhiLQg/l9xgVNliouz
	30xgMRxpTS92v2RURKUttTBnACOVPGBrMvExH561yxIAB7nmObfSIOSr1ky6xjctU/pysjK9yqn
	No5LeNMYU6RtjIZBcc3rZKPZm1fmAmPoRkQ2HQHOE9x74Z014WcN2gXvdRWy8xsXVux1dclr8dX
	CIunflTSE33aQNqH+uFX9YmFbhv1cs4Qz06WQ1Er0+rp8ZNggGyGuJ3trmMGxIGf+TAKpdarFY1
	+brEHrY7YGy5r0lP19obh4NtcjQN57AG6BJzieLbwoN+LSHVFjstUUnp2bQhVkVkLqvvmxi9mP3
	cilWv8qTl8FnS6nWQS
X-Received: by 2002:a05:622a:608b:b0:535:1761:107b with SMTP id d75a77b69052e-54e13d76489mr67614941cf.31.1794010863451;
        Fri, 06 Nov 2026 16:21:03 -0800 (PST)
X-Received: by 2002:a05:622a:608b:b0:535:1761:107b with SMTP id d75a77b69052e-54e13d76489mr67614571cf.31.1794010863025;
        Fri, 06 Nov 2026 16:21:03 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:01 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] mfd: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:20:49 -0500
Message-Id: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqAIBCF4VeJWSekkUSvEi1Sx5qgC05FEb17V
 ssPzvkvYAyEDFVyQcCdmOYpQqYJ2L6dOhTkokFlSkuZaTF6J3gzfLLQubOFMaXyZQ7xsAT0dHy
 xuvkdlwPa9S3AfT9JAH4AbgAAAA==
X-Change-ID: 20261106-mfd-subsys-63dc5bb82f83
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=AYswpvPVCUryj51+P1LGK9/UjRYirXKlC5LdoCoqFdc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5T17sENr9/zCym3LGN5WLlp6y9u3MOdpuJuDUla+R
 uwfkzsMHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkLZvhr1SeuZtycTJX6sKm
 lG6bnLoAB87Ld5vNeONt7c5fSK3qYGR4o1l8I25S3JrGvlru9bYuL94f3HnyzxUZh4K7DK9nsfo
 wAgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sRO3Xx58n86ChlFkrmECJlZUnpCpJ5wsoCkARW-XjgM_1794010863
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      mfd: qcom-pm8xxx: convert to subsys_platform_driver()
      mfd: tps65911-comparator: convert to subsys_platform_driver()

 drivers/mfd/qcom-pm8xxx.c         | 12 +-----------
 drivers/mfd/tps65911-comparator.c | 12 +-----------
 2 files changed, 2 insertions(+), 22 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-mfd-subsys-63dc5bb82f83

Best regards,
--  
Brian Masney <bmasney@redhat.com>

