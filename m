Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8FB439F75
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525134; cv=none; b=HeesVEC7n59QKkZYVYcTkR7+enL1cmuKdNp483LAQtdLwCdHkun6ptB/QqcY3pQGnpfDWt8Ob4lnFs4zBrjcb6FCIyxN4c/MjZ4ymZvffaOvOoUgnXi37TAzGxfaO43TAGR5GCShx/gOG5q8QzCHksyBM+7EqG+p7ljIsg7VBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525134; c=relaxed/simple;
	bh=/VdFqbxI+O0ZixFcT1LjOZJ+yNNNUo8ON3GgDpLZOJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNXqZzpVdclmlc4mvdLkMjgMPuEeGrhH17IFqskQ6hnGow9D57RJ9YP2PlYDIXG/5OxJzP4CAVkLBWQTcabbYZDW3Nx76yeF8vrs3ZzGo27HWkkZI3Uaq/EfqDNK+HNeSUeGROuSzUziqtTczYb7JNnPGdsqT4vqcFKqLPzCUl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibNvsaYW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibNvsaYW"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso753900a12.2
        for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525132; x=1789129932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxOASbJNctMhSYA5GtnhgOb9hrNORKE9UeLES6b/op8=;
        b=ibNvsaYWbQcTFpL1DEdkdNd2jWm20X/mMe98VlvSsoFFTiJakJoFGaz5Z+hJ/TNgDJ
         z1CTqljkUgq7yclOWlNkQMbMjBbd1wJvwmVo7KznXkff63nBVqoVCtIL54/n0BnUFotb
         pjCaR89qy1ol3PD5phbE8fpApMpOKy7zsOhyEiSfC195TC+Em4CEdhFhqTXfFre+cD4Z
         qlEDf2Yf86HA5SfO5RxS6zVfyAt074FtF7jAOmUoUhT5Ywq/C00/Z6NC67JqUTFKksdD
         uBvT4I+VViaztn681Mrr6dfwnjCXj0r8RI/7hbFR/DXvQmVq17cjwPSxjZCNsd3xj5N3
         fuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525132; x=1789129932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxOASbJNctMhSYA5GtnhgOb9hrNORKE9UeLES6b/op8=;
        b=hEBNKmWTDbtC/er0IU8LtpSmsqeNQVqR9q8ixoxe9aFSFUgjT9s+bPWgmeqCsU9puq
         DQDVG+6EINzKT3y68weBj1lpwDB+qHvrObIe8Gmk9zllPvP3LKfItUxaAxTwiRN6qzqU
         F7NJZaptQaUfKvknhQjyHyI5wz2uyWQSb0MsSsBJkedxw4MB4gl2wzzXeX1u6Q2kvnMm
         MHSlhp6OdB7iuttB9SIjghi4Z31gGurkkQwPIfHYr9H5sgJ9S6EapU9oh8tv4PFYKcu7
         sc1XCdovOf4E33Bsxn2wcBoSooMyWjwzaJ3KuG5gesD8E//mL8iTHym+0y7tNHyPhopS
         NLuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjDCNc5yM9xn8XX0dmK9k8pJzkd/BK2vwDiS3SMepnHa/FOMT3JaayjD2CA1U9k7IrTFQ=@lists.linux.dev
X-Gm-Message-State: AFuF++meEPplULuz8mo8Y52HCcgnQ3irTYTZR3eQk7+B3vzXUh3GueJf
	X4MBEH/2+cByH5LC71/XBAk/3Cv82GecQbtTFLCAKkyLg66rbJ/pXF92
X-Gm-Gg: AYBFou3sJo9PMQNokaNkrJrG6Ib+8fNNEkJpSRO8VH0JUq+2gNPS7lgkq6lgbZid93o
	9TLtTOSNl2kOJKQ/r/kMF/oS7ZwLQRn6aLHDXrZm5neCUo6Dbk5JXg+iYCGSkhMyYIyupx9/cg/
	hdBmeCzee+wjg54eURl1a8SvJXEVHo4PwURi5x0VegLl7fgB9ryHU+HmVN+5BxOoBYXP6velos4
	lductlnr3nZXsRRi02OCXWK2EhzPnKFAfyrGDzw/G+gSWyBP8FXvJOzqBlDZ0n644mCsD3SmESx
	RmQbhAIWmehgBNGvyRFFzRlVtmyfM4axNE6MTZwnAe5rmBCcqK/aZS9OACWhrxIrzk0zVmkbxKx
	ImJHdjdK2W1Lxb3dMZjpAYUKVJlVnWoY2Jjz06SsiKZPZNOp7mP+93amBdJe64utv8qvCeX7u+y
	IfJhYCpui1wfwH2dorByBfmRK2WBd0fW8LOBfPCmXZxQoHsfTHiAYn76acHCopZ0KMLbRFTfrmb
	NHM6pQD5TrFfmI=
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr10115258a91.8.1788525132084;
        Fri, 04 Sep 2026 05:32:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm6262420c88.0.2026.09.04.05.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:32:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev
Subject: [PATCH] mfd: fix typo "interupts" in comment
Date: Fri,  4 Sep 2026 18:02:06 +0530
Message-ID: <20260904123207.36203-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "interupts" to "interrupts", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mfd/ab8500-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..ceea1ae34dd8 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -125,7 +125,7 @@ static u8 turn_on_stat_set;
 
 /*
  * Map interrupt numbers to the LATCH and MASK register offsets, Interrupt
- * numbers are indexed into this array with (num / 8). The interupts are
+ * numbers are indexed into this array with (num / 8). The interrupts are
  * defined in linux/mfd/ab8500.h
  *
  * This is one off from the register names, i.e. AB8500_IT_MASK1_REG is at
-- 
2.48.1

