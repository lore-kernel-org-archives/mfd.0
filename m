Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B1C37105A
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151034; cv=none; b=UivdBWGjcpnMdZ42iJcbsBi1RyQMO+Sl2LmYFSRfpa6YriTfZbJXuL4b4y4KoSejkZN13NDSfMLycZI/jlT/3IqCBy2QUZn2LuEELyrMvbE3NH4OovpLkU2kCMU4P6hOhhz70fsNjYyP1nYbPBqcpHn6v9oSdGbQpyAqiVtrvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151034; c=relaxed/simple;
	bh=F0lN5jNXo1HR/IXIt1s5qsnfRbMoIHmvZzGoYNgvGw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvGAsLTyO4qq1L6v0a2ivBXAoFTMQwJW424cUXTGsUqUVIdWJOTLLr9OSEVwQ2Q6GLBUNStcBHXWnWI8mLrZIi42bO7Lj2uYV8w66AcLGGLuz8Xc5MRCjfTQzHBtWGVXpM+n7RNDLQnWQFVkMqAmEdyY5hx8eZC6H+A/YD9DNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZLTnehT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZLTnehT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac6008c914so328118a91.3
        for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792151033; x=1792755833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+td6jQ9eFxr+J3I9/ZGxjpxAlBZ9KrGIzgJ7io9vyc=;
        b=HZLTnehT7rVUg7DYtcEEfTiteo2MWWGGrt0UekIcELqTZGJvJGC3RfgHy1S0qXdUmv
         EaqncGon3xLJx27PfjGimwIwJU2kxFryyOsY9mawRssWodeVVVEclmhBGgAygU/FJFcK
         VQW4pcXed223/Qb5IAJ8LN37d2N+saezwGklSNZNL5KhiR1nu9kLaaqSXJITF+MKSN0z
         J247PDm96RJjUMshYSZdCnFQSOruPy5xNKXPVP4vVhFFmhXn1h8iux+f2u6y47x9i57Y
         UGa6maEg2gnKcUwOclOGk6/4bG3VK4w3bsLAR4sFfUSPeKECGdSuXbuKgK5dI7G4ZN52
         KsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151033; x=1792755833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+td6jQ9eFxr+J3I9/ZGxjpxAlBZ9KrGIzgJ7io9vyc=;
        b=v3wTGLSoM2iaeOQsh9JergU5jXVg9L3PiCW7/tG2uyCt85vFPJJAi+X3MkQmTXdbFl
         xWyO+W5JQxUEoZvOs+hIws04fKiMWQ2Unl2o/Yo7zZWNA4xDjHoUzwtR6GMlQBgwygiq
         1i5y/cWdvFCDZDWD+ulujJBVEWHr17jWBiApO/ENffpWqbDWzlr3EQjgZy/AyfK5W8Et
         3D9O6gHQz7+9UqnAkWRyo2DudYfPhZVaEs63AQpBRYDEynpATf7AA7zUI8RwoDrFZfN7
         9oUBJ8UE7SnhiQZryArI4CfZ1JC1z313T+2yEh0/SveUz8ssRWGjiKykuO8B7xlf6xrB
         yOvA==
X-Gm-Message-State: AFq9FYK/9r5OPVqVufP1IKM7fzMgen5M4u0Cabc/+cb3AMd8JpnAqLtq
	0Rk8u4eqE/r8RUp2LTNtqChFMNfTiz//+Yq+r9UmeY3eoGUTPjW4DeutWzMB5A==
X-Gm-Gg: AYBFou0R5gp2beMRYvQjAJ6p0+xQsW7+3NrHHTlYQBxIs5FntyH6TLhdba5k8qM5lGG
	SvzYEuaYt+zNHSapc9cmUvbeXCj0wgG3BSq2eql/AYtla5OKrCkQtDh2SI2aBJsHd3gbLVXS7vI
	Qg7NWT57u5pKliG5fuGY1kpcEKqa4AvEJhd07kuVIesjZjJP5VEUD6ifxDSqGHJQK9Icu4kbMwq
	7crb8EkQsw0SWMiuoPQVZ+bJ7iUNIhEZD72RZ3iHfcCsg+c0Ho+aa/NnrKXB/UFsM71LkJHVEfS
	FUPhjByvUq77GR2HQWaDx4arHtZ6LkwSg2T+C3xq+38nFyMBcXVSOepMCiIW9JL7ybQZZ4FlIBA
	3MQ361ik4xmB0eD7dSvAD8Nh5aGCTJx9J4AbzXk3xrxT0ytlzXKkALCRGRU4kOfZpgBgZyAOlVF
	kW44pa0JeTvsnVvPby8eIqthVe9cFbeTrnyYL2E0kaYWBMWtKgtcmpSmqEdSrkpKWBUUXHobkgP
	zoA9ZDR2hgBfmK8oBMEHpQc4vHAC2L2eSgAqFfYk8+ImdvNHtSqk1rj5Pe6CNYJZ4lSfplaoFTn
	m2MrrZoxqlqVQpVHKA==
X-Received: by 2002:a17:90b:1d4f:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3ab3ab31007mr31561330a91.4.1792151032639;
        Fri, 16 Oct 2026 04:43:52 -0700 (PDT)
Received: from cachyos-aura ([45.112.151.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm7108349eec.0.2026.10.16.04.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:43:52 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Date: Fri, 16 Oct 2026 17:13:47 +0530
Message-ID: <20261016114347.23633-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
LPSS controller still sleeps the default 10 ms d3hot_delay in
pci_power_up().

On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the delay costs 8-16 ms per
resume of the touchpad's I2C controller, which lands on the first
touchpad report after each 1 s autosuspend. With d3hot_delay set to 0 the
power-up takes 64-256 us and the I2C transfers that follow complete
without errors.

Commit 815b4448198f ("i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel
controllers") does the same for the Intel I3C controllers.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---

Notes:
    RFC because I could only test Arrow Lake-H, and this applies to every LPSS
    generation the driver handles, back to Sunrise Point. Andy, do any of the
    older ones need the D3hot->D0 delay? If so I can limit it to newer IDs
    through the driver data.

 drivers/mfd/intel-lpss-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
index 63a3fb58566..5672f033e5c 100644
--- a/drivers/mfd/intel-lpss-pci.c
+++ b/drivers/mfd/intel-lpss-pci.c
@@ -70,6 +70,7 @@ static int intel_lpss_pci_probe(struct pci_dev *pdev,
 		info->quirks = quirk_pci_info->driver_data;
 
 	pdev->d3cold_delay = 0;
+	pdev->d3hot_delay = 0;
 
 	/* Probably it is enough to set this for iDMA capable devices only */
 	pci_set_master(pdev);
-- 
2.56.0

