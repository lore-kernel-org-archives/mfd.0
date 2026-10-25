Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956983;
	b=kLGFXhpSHPQI4vZKWIUkKrtuCALzyli9FsyDlmInD7axniT1ksBouo+BTmGXaByFZxM5
	 fIChtzdTy9bwm76WZC+V6Z3GuZiJGmK1zO4fcqV5WB+q7ClAEMvWV8R/SaEFrtH5RnPxO
	 jupkqRIw/5YrdoDa6NpKEOFtNtvymaGKvNngbsuTmE3BoiP+cpdoS4KNnMX0N1nS96suI
	 hnNqnn39L/Fv0EcWJ+Xj4i4rckAfDyzxTgTNFdVcICDFR9J85xwhBQkk6doOb0VFz9plp
	 2uKkQHBWlpqtGVXn4ctWt7EmUPz9asZU7VbrZmSzc4NwEuwhx7LbWM/uWM+oz5kTtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Usi5Od7DmgDnTI9m3ylgBp7hWkBBCLCcNs8Nj1ahbJs=;
	b=Em63JrfPzcrRws4SvoL2f2dv42PwSZQtDA3a16sMymEcvTJRtaQVEaGX5mVczS6SXjta
	 OicAdvR+wKgLNicrwUrqiZomzhlT1Y60SrUltkhlkU03MdXaUlERbqXxnBbSrVZ642X83
	 6Se12pEQHVN8q6wvonG/v7so0u/rO6PdgZxckMSECjhg9arkoEsa+TOrWBqRan83L2Bps
	 2atSaNUdlb7kPely5kKEeySNhipWKt08fX6qJkgk0/Uto8cT2ofRQGoOzczVioJpLAvqG
	 7hX8S4PFiwXPIwg6pujfu7eKG4BsSZzoBvJuEIOZplV+giDxosB6ecLy5kTXd205P4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TC00MED1;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9DA606A31B
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 19:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F9DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TC00MED1
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15943c9be84so126729c88.3
        for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956982; x=1793561782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Usi5Od7DmgDnTI9m3ylgBp7hWkBBCLCcNs8Nj1ahbJs=;
        b=TC00MED1qeidqBQeeu09udKR41PiW9xkXLV3RWGOlv3eA6h5BlL4Us86sPIWe333Ma
         IOTfOpxWQwu8Avi4HFNwj24kxxjtM3ECXN/5EOed0owdBYGnWOm2KuM739mda6p7qU1H
         Ln6UAArLTlgQClrFWSKHVFJY36vBEpLPsfJv1a2iC3Xw2/QMfF5pVTHsNRk3lETdM1Ri
         GKlZ8wCDQr6TGxlK++IkCGPDTRQWDZbOvY5KerVCE/KAdU/u2PcC6uDsHxu+ZLwTmes0
         iq9p9RNVWGa1XiA6+Srva+VCuFAqjfMABS48Vr1gcfB5AwBzwa1lEigxCvl2cJIrv9k+
         nOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956982; x=1793561782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Usi5Od7DmgDnTI9m3ylgBp7hWkBBCLCcNs8Nj1ahbJs=;
        b=P/rK7Shxiic5JlDtVZhqGRT4SoNePBddEHeLCQJl9UFk6+5EFVH1SG993K2xO4kOAy
         G7nPCos3hZg1k+Q566UBKse/OvI/iAjhQAbJQ7g9hqkyu9T6kkoH81M+rG7Hx7cz/0ch
         TUx5c9CUADPz9p28ApVXY/x861c+uqZH2U8ZFHdtAq1NNI+fC03tjPvHJ+cSAncw7+E2
         9Zd8SsviWjg/ZW389oleGsbiPf/rojh+unqbFAaTWuTyRsLubHobICHaUQS/SxSvi8F5
         Eg8Eysyza1TM8G9xIbbPtItrVoC1K16jKuxDAFgSvftO5SviQisNUGYJO+Tojq6XZNQc
         HASQ==
X-Forwarded-Encrypted: i=1; AKwUvBzraToaYboNdEKotul52xKigBySnEthpOTebK0/BRnrCIHi0PRS5Oi/qdefmby+MoDNXaA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKd2VKykvtN2Cef924m1IfTgcgJm9NiCjp9Ws1b44o6/EIF/aVF
	BOm8mIICdLVDvMREKfE/B4W4NvPbAnnFk29adG6UwQ5i7EFIx8mB+FdH
X-Gm-Gg: AYBFou2bK7DW0g5SE1fqKZGV+pvy8Q7zQ4tqAkYc8pcfvucW2m0FNO1fc2ITquxyOAt
	KB1O35bxxZtUtg3MUrn0kgWGndEUmyGYSWujkWGvRNTAnFC345YB24fHd+/nyouAF+WNjdIT53R
	zcyP7QSwJVy9TVc++nB2N02pxWDa/vNMnB5cdoWWHrbmrWrK9f1EuIZmQOJ3I5JaTXcQbNun2aM
	LRza7d00PGVmQ5lo2v65Dgkcg409SCP2RYTJhS9KsWSXrOV0ml9RaHAisK5PfKRpArqInYzvYq1
	a/XhN8A6zNoON3gnKsCOwyq5QcWDaXjy/Ga0dwT2YIDyT01/5soQH5DxJ2d1wf0Fo9S0HT5SzS4
	xlsuacsktbEKahRs5+wh8FB0fpjyNJEKiItLg+P4/nKb62rd2cHUYRMPHK6/b+wUPhi/XMXKsXz
	XTKH6WZzpKbalPeYShYeDOL6EyDQ2v+kZep8fZ+2ixPcoNzoTHU+BmZpXAowsxiFBfQ/rSldDTv
	hQuAdwFFT/Hd7W+8H2KQ81lTbLv63rM+vwdYyaRVLaPlxkKLQjSlFVp6QpIl3AXvEFvnE4VLUpN
	u8K0eDYgdEUlwUuBgqrvddKB3eYv+e1MzwYCAiluHbVODXMkdRIpj4icoYMuZwj2YZMmUSzd2pg
	=
X-Received: by 2002:a05:7022:4582:b0:190:e602:c769 with SMTP id a92af1059eb24-19933e0f4e9mr13886917c88.1.1792956981595;
        Sun, 25 Oct 2026 12:36:21 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm21412877c88.11.2026.10.25.12.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:36:20 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mfd: intel-lpss: Set d3hot_delay to 0
Date: Mon, 26 Oct 2026 01:06:13 +0530
Message-ID: <20261025193613.278610-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Every runtime resume of an LPSS controller waits the default 10 ms
d3hot_delay in pci_power_up() for the D3hot->D0 transition. Nothing
misbehaves, but the wait adds latency. On Arrow Lake-H (Lenovo Yoga Pro 7
14IAH10) the touchpad's I2C controller autosuspends after 1 s idle, and
the i2c-hid interrupt handler for the first report afterwards takes
12.6-14.4 ms.

The PCI spec asks for those 10 ms, but Mika Westerberg pointed out that
the LPSS controllers are not really PCI-connected devices, so the delay
is likely not needed. intel-lpss-pci already clears d3cold_delay,
quirk_remove_d3hot_delay() drops d3hot_delay on several older Intel
chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
same for the Intel I3C controllers.

Set d3hot_delay to 0 as well. The handler above then takes 1.1-1.9 ms,
with no I2C errors. Only Arrow Lake-H was tested.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---

Notes:
    Changes in v3:
    - Describe the delay first, then why it is not needed (Ilpo).
    - Give Mika's full name (Ilpo).
    - Add Mika's Acked-by.
    
    Changes in v2:
    - Drop RFC and add the review discussion to the changelog (Andy).
    
    v2: https://lore.kernel.org/r/20261022040453.45797-1-navonjohnlukose@gmail.com
    RFC: https://lore.kernel.org/r/20261016114347.23633-1-navonjohnlukose@gmail.com

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

