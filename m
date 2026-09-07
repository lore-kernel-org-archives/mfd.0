Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7B37E316
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756833; cv=none; b=pkW43ilcpIeHMwTtJd/CXxPEqjNmB/rn/esbHglVX7E06lydDsK5Ejq7IbRHRCiHCPJXI90MXdVMUC9PqZczNR2bwdK2T2hWiwq82hvlkSb3DDVDM6WgEG4I3sONfcZYYgPG+863CHZVlH7l2yBGrMdJ5B0hwz8wbCI9rdWYFNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756833; c=relaxed/simple;
	bh=HcuxoODQkLAG6+IO7GBsJ2AnnmlrWzhvpuB0c6OY03k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coSQPOaWHwIoLFUIUgliVyTX+jUQ2+dDD+Hj3FP/0h4/ZSuMn8KQT/TkwEk4yeirJz3tdX3ybWdzaA4XiMkIafHXNUzytH+2mt7TooUm/IYIT+tW6TX/yTLQTNnnlVQ+dlIr9gMq9PKF+rlENCGFDGTG68uwFOurFBlr9N1sYnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed/I2gCU; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed/I2gCU"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2038128a12.0
        for <mfd@lists.linux.dev>; Sun, 06 Sep 2026 21:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756831; x=1789361631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tIXXjI/FJbHoDDsTPHAM2mcOs2CeLdlEi+w8VdW/jfQ=;
        b=ed/I2gCUPkygiDOdbEYhEuK4gLtWjyiWrRg5hPnaJdNw5LLApKHcUyI1zcwioGybrL
         zkxKc6J79ifpCiiAvY8dA7c01iv950PRHAZBS+z/TqJPMcTMLp0xMk2H+Ed/od23AdIL
         EOchWWviPefcfaBQ1WzJAj74QIp8q2kcCPiWIYViPwiomUI34v+NcaBQstPGle7WFe+r
         c+VzC//GurTOB0u0h2evRaZt8o+1AHo6tY2Nccr8tY9BCu91enryLVe2TsMa+B9VbeK1
         2YI9xLSkYsgarpn3GW0G4j1lvVxpYpYCeOry0Gq8Lel7RcJ/K/vgkb0gNyg1eiWVmwle
         7r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756831; x=1789361631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tIXXjI/FJbHoDDsTPHAM2mcOs2CeLdlEi+w8VdW/jfQ=;
        b=PYu0Xc3SY1NvjqA9HziYbgLpjXR7iq+83lBC3CWd2iRl0VYbftPwFoACNJ8JTVhQ9w
         54GdVrhjiuz3XBE5p+OuBaKke0eL5UCmf5w9oKU3gDD+Ojm0Plh1ycLjpsJZYXKIDjqk
         y1BdhBbxRnzcAYvTUa/NQp3RvPqTObQvthGHnSlHfAifCipg2LK7hAGQ92D8Gk0hzbXb
         BOtP6gkcrY0IQaTfC0cQjNqvHX0GSKD/zi9f2y69IXHvuXWnRboaFdHuvdYdTJsWxqOK
         J6PaXQbwfQd/AURWQ70FebfW1VmrBdhai6Z0H06c1DeADcmSgCRRht+ZpIVEgzelQhll
         aS1w==
X-Forwarded-Encrypted: i=1; AKwUvBxzX7ZjLWjXJAqjge+g0kp9zOZVOz+v1OPRNij4zYl01wBf6MKfMDs6X4qx+Wy00juDPis=@lists.linux.dev
X-Gm-Message-State: AFuF++nTLcRg/Lezb/nWZIpKh9SHp/e3/ES1icBbyUmQLqw3/hQ4n1k3
	EyyJ9a6bF+c8k0+iwtWhJp/KuellBgP82NOjWlO4esv/GAWQ9oZ0U4/h
X-Gm-Gg: AYBFou0+O835iYEk9c2HOJQGtvoG/5MTqnYYmQBSjTDY4orQlou7E3E52qoiN6xlA8x
	HxQCCdXbdt/uu+c2m11fdlJl2GCmujwVoUkC4qU8rGqecBbwv2t50Zzuwc9TqzDOBwpo1voQbo1
	kl0B6kuLX6wUFrijH2OIHt/v70Q0w1L41omepFRpQdm/03bR1uJgzIvyZTPtVVjcMz7ABUUXwni
	+UUhCJe3pOqMR7Ok4B6LATsmL9fbntsP+l2t/XVqj7UmGLC2Nzk9YrCcHOhPjZt6eSkeW2HzfrH
	68DzJOuLdHw53mW6ldB0qV3IEzfE8M6O5aNi5mg8b9+n3GqKMRpiyx4SYQs4HY1VHZIZFh0ayLr
	5aWpkYv/xcX8qXaj/DNqEaVBbychnUqhmhC2IPUSle8tmxkoYcD45D2ZI4XbhX6OO2xSp0HXpIn
	rXMrz6BOAFos0hrxtcSl9jLXsMsZGjw+Xl9RBuhxUUcrlgSIWOFX6f3+jfRxsufE1fKJIsT4sDp
	KS0yg60GEuFMA==
X-Received: by 2002:a05:6a21:680d:b0:3d3:aee4:66f3 with SMTP id adf61e73a8af0-3da3a22a052mr34116677637.25.1788756831031;
        Sun, 06 Sep 2026 21:53:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 3/3] mfd: wm831x: Fix typo "convertor" in comment
Date: Mon,  7 Sep 2026 10:23:31 +0530
Message-ID: <20260907045331.16932-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "convertor" to "converter", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Since v1 the subject carries the driver name and a capitalised
description, to match the MFD subsystem convention.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/wm831x-auxadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-auxadc.c b/drivers/mfd/wm831x-auxadc.c
index 744e1d161c5a..6280d4f38981 100644
--- a/drivers/mfd/wm831x-auxadc.c
+++ b/drivers/mfd/wm831x-auxadc.c
@@ -132,7 +132,7 @@ static irqreturn_t wm831x_auxadc_irq(int irq, void *irq_data)
 			1 << input, 0);
 	wm831x->auxadc_active &= ~(1 << input);
 
-	/* Turn off the entire convertor if idle */
+	/* Turn off the entire converter if idle */
 	if (!wm831x->auxadc_active)
 		wm831x_reg_write(wm831x, WM831X_AUXADC_CONTROL, 0);
 
