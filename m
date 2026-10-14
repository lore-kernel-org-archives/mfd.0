Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6ED4DD3C9
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979995; cv=none; b=HA42IGzKEDhqYxnB9GPRFTHfsEDpmz7xHvS+pPSbKk4bv3RnUiZUz1wb9maqxPJ8ro+ehkDBhmar+/d0Co8/OR9UsayHsQJ8QSNzZdgZm5YwhA5/SbVJWqAO6epWx/l0FFHgDGX3ph5DW4U6irk7p51rp4K9DRg4fBG1bK67gcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979995; c=relaxed/simple;
	bh=tUpEzOCfmUF6KJldh55ia/zdgVa3346cD2y6uHf2ak8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VT85ltAgdpfPsAw96g0LYK+YNKb6qhkenB+6Xay9nRiFCRerO42YsuemBV+XwnuxbrTO5rbpc9M6NH4edmTkvWbpqtGZrxjTDhDFKpbnaoAWEFZJSbOD7+nf68Uf2Jt7ZfDmYbTQ+2rhv9Vyyr54yub6mrEjcZquGQwi/nGKovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjJaJM+Y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjJaJM+Y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so36686015e9.1
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979992; x=1792584792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=TjJaJM+YRIb1FNfJmHQIYPXIXJwerUZHOzFUFZV8Ds9iRu+zzlF1GpxwhXlamApJgO
         tBHfXQ/J6B2YPvTRbdMbj8MyjhnVJ2D3tXAr2Zdsh+FiFB1q9rgu/R2SgFNQC+Z/C1tj
         C8hXtIewb0i+Y0/dl1DVrOkPe+usYK3Gas9rg++4TTRexgP2F1KApF3wBbZId18tQg6o
         W8YrGBXi1F3TTNnCtbmF7W55ZOoZ66QDSS+6rSb2YrTRVg8gg6WcrFY5SbuMqQm3WR4K
         Q9mymwxpX2/YvoFnPXKoF3IxCuv6jmb/QoZ/RjWxgwazhR7kO9W+2YErz/XTvL8QWaCk
         eKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979992; x=1792584792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO9cpDsPxHB73dE4R060h7YW2QBJW+MLJY5+WplAuUI=;
        b=Fnv4XpLE0GgF/5k00yS6cqlPos7cKeiI8E4/VGrsl52nPmYiCGi9kucB4BE5vwZkBe
         lRYl3SAcxDYIgbYWPeks7TB9kVpUFOx0zhT8Z23vac4bnmyDhh10JG0iQxBfMfBWU7f1
         X+B8nJYvRT3LBAlMKpkMoPIg/E12CAZVQrKQSm2VoYFT1tZ7LVg4HV8BO0tXgDRkOBWI
         PaqSa4sYAu4Okl2XtZr/JVyqTKc3cX/vIBquJGDVH0dXlfB6f3mKI4JQV7hiFaWCe6Iw
         VKd5lOZm97ab02gXk3FJwipFYN0vV4V3budzFJBuUORT/Bh++BuWpAkqhd57Yw7FsAwX
         GExQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrq7c6+72jc5kdrRquf+RSEqCEDPJV9EoO5EzbINmetJwxzDwc4cMqy22A/NfvVhZSG/s=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0q+mdwHiMOoa2AqW7oYRslhZSUCehwYLcZ6t24UOtkWM/IyzF
	GjNXW+A2tQRUX/U/SkX6UtIXs9dFuLBEcj//MB1wsMIa/vOGaXjEqLJU
X-Gm-Gg: AYBFou0OWCW/OBqnn2GI6yk9ZYCMHN6djhyUxSAcbHxn4ZfiaNPXPdaXQkdSrc6mube
	Zw7RpxiAHz7EVoEXATH3tQ2eyHXklqL7/QHvbwv8+mqRhklTCvjms7wURfy+8WYaa49UDS/rLUR
	X0NRoFUBWztyDZKh/HUvGTbaoqn6ualRHFhuYddIPJd+N5wRHODtQ542jYwAwkro/KHVBvY0IwN
	doc1CGTiV/NYZPG/Rf3xQ6wcTuVZK26V4myk4oBeLdZC66MbUnWGKOGG3o2m2lyspcGL3wYepdT
	akI9HF+AZlf/ZTuxRO1WzmxQBCq0HfNVisBVpFqoAx8oIO825Pz9Spkw7QNaTiji1GgNFVs+9PV
	BXOFHdmIAc75uxxqfEfHH+MXAXiJ800BsRn5DgkGLzpjLObOXRiWCu5fdC1XWa5YZAXfX/ZSzXd
	pGzOjp7Dsz/b7di9P2u30GAGDyyQCraPg4qCMu486lpD8/MPwiCTu9In0jV9KbFRQREpx+/5d0F
	/c9gUz7tJlXbCoZ3m8=
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr171728245e9.6.1791979992192;
        Wed, 14 Oct 2026 05:13:12 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm11420985f8f.48.2026.10.14.05.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:13:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/1 RESEND] leds: Add driver for MAX8907 LED cell
Date: Wed, 14 Oct 2026 15:12:52 +0300
Message-ID: <20261014121253.133467-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Svyatoslav Ryhel (1):
  leds: Add driver for MAX8907 LED cell

 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

