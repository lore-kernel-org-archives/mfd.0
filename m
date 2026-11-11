Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415062;
	b=KRsjIWGTXrujP/OCQ/e2wp8nI7HtlLVGSEx6koAa4B0R6G0oIzgCcZsJyasOB76Gdo3O
	 iiGZlvO7H8p4Yx3RJmDxnRm6T017KAqqG5272KRLBmp2XDDVyNcsoCnAi4g6lBYvskiG3
	 yD2wwe16W4IYRLzp9J9BZJbEggraOECSMwdNqsyA2tOsDxYMnvlwBm/yZSe89Zrj3x2w/
	 Mx9dIRAsyZJkVbS5ylUndiaaXhlT+hjLo93mZwHlbCfpbyjk88H+U6bldetn/IAifpaCS
	 zmxr/glk/QpD4vEXv7uLdIqMgPsQUWy8Kl1AEwfiYFQVGTIG8lZF2rVNw8xdeS5yDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
	b=RYTCQuWkVuQVorkpirfcURsiU7CjGlhbz/8Tjd45dUdvqVGAS8xYMnjilTrrgGFxoVI4
	 JsdGv2JrgFXxUiFCQ7ep/uB2nf5UoJGiA/Exg6sy+KtIshpRSD3QbKnt31nPh/sYj9ALn
	 MxfY++zQ58qjNBcl+ulpEPVVuaqGXwlCzGSXpHjGoDJz66O+gyjU8BTLWcLmCtnHCyMK3
	 4q5lgNSKZR2ZzIoszmqxDykUHoPoDA26yWYrz9EIp2qTK7yiUEqeIaEsL4CPQoDctUfr7
	 ayYvB3tjeemg3gaFenK8onPfS227mzVvZCFNbOB0eOEcaAw6PRa15/YEJ0wjha1L0CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgSg823B;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D234606A893
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 16:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D234606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgSg823B
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so31020725e9.0
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415060; x=1795019860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=EgSg823B6y321vXVa1apPZf1kO59QGTw9pFz7S3dfOQc5MHd1oFEFDm9r7RM/O+x3d
         UgQgT7zgPVoGKRzqvKE6RLGgkIZFY+LY0BstDLpA5xgNs2HR/82H6z/CxtpqP15EHR0v
         EnKlcKcdUIaPe1bbHGk83rhowfQaaCw7vwdbxy2Q0vjRjt1ffJ6XqLFKe0MSvxGYOWX1
         DPGkes6MAEKwPFYD7UriaQBfd+9FGvR/94OBIir79lqjBRp2UWX6YO9OWdx6Cpi2FbMW
         57g0c6CrGOkbuT5zIBv1fc0m0Kvwl3+xrUcBE8CMdPry18MBx04/KKmL1ura6WjSEdgO
         UnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415060; x=1795019860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urN55C0hSRid+Cb4EhN5hFHoQJs+a/cKjFFO3dJMiqc=;
        b=a84Ld3Mf3lsj6h7f1XebTMrZ2WGeQysfsPjFCTIPaBm6qVXiTE6Ppf8Covgi2T0/qN
         0NszB/s0OfEu2FZ/XNUxIqSr9t0OCkhTLywYuwY98qjhBt6jo2S7dROOvu7hydeRT+tc
         Ab5SASKioRPE/57tIwgnRNUpSDF3x8tslZpb97QrfhShjgaglAHAN6RqINATx0NF3Rzc
         IYNH7fxTNV0KgDO/P2fcg6wbs4GZzdC5i4z7pyxh2zuEtCXIhAjEHO3zMwDIRJGJCQOz
         I424U26w0zQfKlaoPCG7Icgiop9cd8ZxvdNggrZRdnpSxLeFT2OgOtDpr3agKkQBN3+H
         N0EA==
X-Forwarded-Encrypted: i=1; AL+hErGpblCMLRAF2tUCyeChQFUSduOGfj3WMDZEWcvlC8KImGUOVnmiU//JJE7PO4a5yWaVlvI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8SZ9QIWt1RexGeL7LnmpS7bZOBahVIe9d3qNYVLR4XisWJSdIv
	umh16l/k9B6itK8WE+htMzZSTd/LBReAyz84SLeOY0mDRE0ssJ90aUl5
X-Gm-Gg: AYBFou33dHsshsofhicmsW/E2UULQ+Fs2We18VCceCWJLDPT0t5lLs9CBZfxz8RktSI
	cxxCZ/E1DVxgunWONj7KhysIrpTEXD1sG3DPTr1gnYoLSi17l6L/E3D2VoLEA8G79XST4AFMFaq
	S9b+ZnaE9XBxsOUh2gAemmaY2ss2F7q1dNOKmfWXPs0oIfMKP3LYbV/N8LUikZ7152DzDTQiE0M
	yN98hGqJtsxsApU+1hdikigMBOkndFX9U32rzFXK7d7mFJig37oIeSHVIIWl/MljSV3+M+TA4Ij
	IVA8psQT2mxMwYlFovSSsMdsmQMyiWDpa98KGyr7I8R3srtHJiLk6Yd947gYDri8VaP5KiwThX8
	oXj9mgKpHRvCj8fPLo+4YcNRjgOLMGjfGTm7shHsVczRkCiK9Z4kDPEkEU/7MYcvvPw7ES1EXuX
	yY5LCnq6c4M8nrPD5QFxI0WYB16popTAUzjXMyonjrAFtxb4HiSc8rAYUt4x87iMHHE6s6BF8t5
	Q++c7lszL5ouatKxPeEoH/YiXtNNacq+sqnkqO3XJsW/mHP75ekexuykC8Cp8GendO0+fuvrElj
	HKal1eZAj89MtOxWJQWw1167ETVX5WI7ASR/ULLe0TPFwpR7ItxrJy03hsewBMfR1YlqTrr2u1W
	/WpQYxBuX7s8l
X-Received: by 2002:a05:600c:3e1a:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ba093b967fmr58000185e9.31.1794415060185;
        Wed, 11 Nov 2026 08:37:40 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm91135e9.6.2026.11.11.08.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:39 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 3/7] m68k: defconfig: enable WARP_MFD
Date: Wed, 11 Nov 2026 17:37:30 +0100
Message-ID: <20261111163735.227286-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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

Enable the CS-Lab Warp multifunction driver in the Amiga and multi
defconfigs, which pata_cswarp now depends on.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 arch/m68k/configs/amiga_defconfig | 1 +
 arch/m68k/configs/multi_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index e2d474e8cb8f..75d91d502545 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -20,6 +20,7 @@ CONFIG_AMIGA=y
 CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_AMIGA_BUILTIN_SERIAL=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 1bbd2aa653c0..120dc68d492c 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -31,6 +31,7 @@ CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
 CONFIG_ATARI_ROM_ISA=y
 CONFIG_ZORRO_NAMES=y
+CONFIG_WARP_MFD=y
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_NATFEAT=y
-- 
2.43.0

