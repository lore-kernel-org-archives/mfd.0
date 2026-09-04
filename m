Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E35456E04
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522573; cv=none; b=n1z7mWfEz1O6USAvfdZd27/d+6s63I7rgGPllaZmp8E7+2ChlKZB1s4UMIl2fknm1Yy6wEo35w1cASI0mhWk7dfAuns4zajtYXA9V/kpycCqp31DTzFKrFIGnTm0AVr/nRlcjEgOwlkptG05MDgduCZwzgg0WzGJfItAfU6TRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522573; c=relaxed/simple;
	bh=5nTjrxW57IdkIRPU+UEstMk3obJo2VZuD5Vqdw3PKD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OM5veY/Js591VthlyGkTuWUf8hIJtvdmiwVqJ5BONPFfMo3djDU8XM5no0F2AKWGcIjJ38+F2nrG8ceV3rtSWAajHb6NxMV7mZmipHfsaegCYJDTUAQjEpYeSfwJe3QYmyYC/H+o7avHJuK18OKhNN8w1/e+3FdF9n4W2qBgVuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnPH1QMv; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnPH1QMv"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so820149a91.2
        for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522572; x=1789127372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjCLIyzePlNTkK1yiS5FCzuzSQtJtiHE3r3cJxDUeOM=;
        b=TnPH1QMvxhXwHcCn5Geev4X80meOYMfUE6AYXDwsMBSWLD9rYy4VdQNc+t8yHjSzsP
         Sn1bd7gFuGfFe08JyCwX5Ujx7NH3nXK7wDRI4Adg6hq9qeYj/LHq6hyugzkyqZD/Y6fd
         BCNJAopco9wpmi0BiQ6XqfcmdMbtT7S1OS73OsDxKe17n7rIWWLyl3UTs7YqNuBTQVv0
         8DnW/nGSlQLEDEZT0dJbT3PghWFmYTNgyyEmgErtsy5eFt0evsYLF8Yv5JFN6quiAAOu
         cBTxlIQwg0u45z5fBbB/bkECkA1LQdkZK0cijWS4qxFtsHHN6IqPHmFqRsABSA+ykSSF
         CC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522572; x=1789127372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjCLIyzePlNTkK1yiS5FCzuzSQtJtiHE3r3cJxDUeOM=;
        b=oziXbHxEhHVR4640nN2Unh0kt1a4ipyrNX0dQuqvpr98C9KAHWiYZC+tABJ0VckQjZ
         e2rCWBYwN1ObxQXK1q52orQ3RUEl5WaMBeZPbmVWUQtKROkNsQWGuYXXI8EwU0JYkzv0
         T1wGFO1OyWgjnwFvjZLOSV3QrHJiKdiedk4jleudMYrUS44/8myxX30bfIq4pPlbpwMw
         gOWFjwe0e69HdRakvjukgbbqr2Qc9ua3GzhyaBG4VVZdWJGc1k/KelxiouhHL1eofDg5
         lSo5f2WO6k2uoz4lsOPk6+828PHKF7DLr+AZoB5Yh3evfNJWcw8fgV51xxZYHI6T51WR
         GOxw==
X-Forwarded-Encrypted: i=1; AKwUvBx5nDXImDPIQaGHtFdDdmU1/etddBrGFxfd/MXdLeXGXvjToW5m8FJopAEO3UTb0K3xmOQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lWsVzGZ99f8jmweUWPGGDRT7IjHToxrxL1SZCpWPQ/qasZ3A1t
	pFfOeWe1xciz3QF/ohVGIrkRCgWg2mWazwBZtTUSiH8D69vZE5qAssEvs4RCeBC4
X-Gm-Gg: AYBFou2PgJvmJN1/8w5JlHDRJX07KH73zvY1iA/JmtjVQKi6RKKMTGlBCQE3T87VCr9
	5KzV8qZDvWyh23dgfEJkf8CkLXG/AzOtQavj+/E5xR2uSqdQpPLq8rrfeOgRUnJOlwprw0Qmw/z
	SpnukBeS/2517hDeNLIj09gGrr7kv98cs6kmyfI8yzqY8rwkKFMiHaKVUvekn64/PQxV8yMJqxB
	1ZlJqv0+mP51JY0Dc59wM59lZ0agQksZ+36I/LmTSPSkSEiTTlsLNOOv2CsCPKsj1JvHr8g1m7D
	wSAOQvIYQkmz/wK89SohmgMPZbE6LddrOZ5+lm+DZJn2DvH51kvfqVQCf5k9Y7jUV1JPp3Lm20O
	+1d/i64O+dA3nOJMRwZ47IIALIYcOKeP65PY4NRqmcgCqn2JR4oui7Eb1iD8VK+nytNbYyiszAA
	N2k4i8Hn/FRKMhBCVYbxJTilIrlBpipYA/Btv/GtxbfgCQLmw605FTPVEy+D8pT2byHOWEFw/Ri
	ysD9lKFx/e14bSTQ8vm6g8eyA==
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr7429499a91.10.1788522571824;
        Fri, 04 Sep 2026 04:49:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm6723317eec.20.2026.09.04.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:49:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	mfd@lists.linux.dev
Subject: [PATCH 3/3] mfd: fix typo "convertor" in comment
Date: Fri,  4 Sep 2026 17:19:14 +0530
Message-ID: <20260904114917.28603-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904114917.28603-1-hemanth.selam@gmail.com>
References: <20260904114917.28603-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "convertor" to "converter", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

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
 
-- 
2.48.1

