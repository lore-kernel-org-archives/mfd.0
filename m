Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3283D3002
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783379293; cv=none; b=mgVHNRQf67NU2aSBHcvPc35Pe0fWAjP7MlI65eyJpbq/XvcVz1dnDaTy1Rgw8YXPKngWM/txdpS6N/tsCPHw5RX6rBFgIFYR6DglrQ9SjVT0m1q3h3Dnlr0G6763b3J2OTV98NFJ2fPSeFNJZLd9L+C3yyvFI8lmBnXC+JftPWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783379293; c=relaxed/simple;
	bh=RdFwbVBmxwC9VLgBeAj7cs1iNxTLbtLD4rrCnyUyFsA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QvJV5ol9SiEzPaj92/UtaLTKbE+pCaptqGpmIstvVvOQ02ZhzpMOGJqGGsyDKN9WUnaAws0TxUZs2zY6Cg9XoQPqvQ1qQW26Z9AYRPeL+f+iZbkRmRB2OdLjxIcZBp8/S5aV4Z45bgFd0PttYLF1twbH4BbUIOk30PEXTldSQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNAyswO0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNAyswO0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c7c61b5292so51676735ad.0
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783379291; x=1783984091; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N0c8YFsuFDYevRGycMGRDngAh5LP4wAuIwInr6KJplc=;
        b=fNAyswO0+QmHMSTWRDErczNQ7UKSYilfaJQ0mE6H2cyxPLBya3vLfvK4d/S4bZNayd
         SFHyBzKHJw7yXtfspJ0hCIeAZMrg8fFMl+/56nyCNffSJpkkOlSfkBGQqngrX1z7vVFw
         v7NRr6v7Ly/e5mgorxzhFC/Sa4bCZ1smN8mNebUniK+Fh+LvAsJShb2RuMZJScum/oza
         PO+5cBbudQoVFHZ6x4MVlbAveqg1+WcDHaoW+gk2hsN8LVvqExt8UGmNDs1ST5mbnZiI
         n+wjWHkw9fO56YNF5Ym9Hu8755vMRx+bmLJz48c27o4sJTo2DT0329Lc9Yu+5D+afn3N
         jfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783379291; x=1783984091;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N0c8YFsuFDYevRGycMGRDngAh5LP4wAuIwInr6KJplc=;
        b=sQqRoX8/5UXjHvwg2NRg0LXb9dmd6JY0zqbeAnyrfSffEXEDRLDmAn2mHthvmlSGQE
         uI8kKGx9AURG/lf0OcaDQlsDAKXAaZd7oYr7x5quRONxb/WyiiXrdiEIgK2vB7GVizSb
         mRUppzv/MzEii8S87IKL4F6jkn2WmMgdWaxotQiOGvxp+dnFNZZXoRQO7aq2/0v1z5FP
         jgyAYpLOHlS7binmyNeto7KCel8oAoQ5NrzypeeGlHz543GdvOrGk7JHEHs6kJt+pP0Y
         LBv9PJjXYch3dXyyd8/ADnsmtC9unzV9xr5RoYd0kvFv69tRzj/1JLmlVWxN/5XzumJd
         KpfQ==
X-Gm-Message-State: AOJu0YxkekNzJ4TVutQtXqYPyVByBJcWOff/k6lOn3ev27HLHzuEr82F
	9NoRCM+8DmFQY+x1JunFekLMKhQN6QJuwWitu09684AxLuUztlysAx4i
X-Gm-Gg: AfdE7cnYP5Mtm+EbAUjAeu3KJNygKv8UDnQAkWYioi9WRBov9xezt+TqXlpR/ppYcdo
	sljY/erpZiXJEk9BqrhKvpSBbHb3eALv5xchTSXEc7fmpiPb4AWQxesdZei+yOLHe7LQ3U7MdS/
	qdWJWd0pPG7AVxbt6+UzkYFJV1wF1yqW4InonSomzGIEvRf970qKtnyeXXOdJJz6N5MUVyJQirK
	KtirKs3bvX6qMageki640aWkCOpr3kbOK5ur1BnlwvMH3BGgJWIi6T/jl770LnxJQ0r/Wl3zTgc
	lNHbEa+O0MBkNdTUUHzCDqM2sHgupQOgSmZk9eZ9faSUwdt97rBV76hAmiUo1N7TgGd3Tr86UBx
	ds34v4ngvkIExyoS/TptlIy9Cfpeet+t2LJC9CHN23hHWsUEfI5+MANLquWc5zkXrbfmS0JuYpw
	FS973OxkI0S6MTieg+E+I33ZWEC9p+3jxo0X7uRwONFKtDaIzgXNGzPXSTrSZJkWt8A4O0LHARz
	cBs
X-Received: by 2002:a05:6a20:3282:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3c08ed13d8fmr3045764637.21.1783379290846;
        Mon, 06 Jul 2026 16:08:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f598dsm1259148eec.6.2026.07.06.16.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 16:08:10 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/2] mfd: ucb1x00: convert Assabet gpio-keys to software
 nodes
Date: Mon, 06 Jul 2026 16:08:03 -0700
Message-Id: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFM1TGoC/yXMTQ6CQAxA4auQrm1SmIgjVzEu5qdgXQxkCkJCu
 DujLr/FezsoZ2GFrtoh80dUxlRQXyoIL5cGRonF0FDT0o2uuARfb0ToVJ3nGXVNY2RsrQneWBP
 N3UKJp8y9bL/x4/m3Lv7NYf7e4DhOUrLcq3oAAAA=
X-Change-ID: 20260705-ucb1x00-assabet-swnode-683cb383d398
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

This patch series converts the legacy gpio-keys platform device on the
StrongARM SA-1100 Assabet evaluation board from platform data to static
software nodes and device properties.

The first patch registers a shared software node for the UCB1x00 GPIO
controller in drivers/mfd/ucb1x00-core.c, attaching its firmware node
directly to the GPIO chip prior to registration. The second patch
converts the Assabet machine subdriver to define static software nodes
referencing the UCB1x00 GPIO controller directly, allowing pin bindings
to be resolved via the attached firmware node without relying on name
matching.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      mfd: ucb1x00: register software node for GPIO controller
      mfd: ucb1x00: convert Assabet gpio-keys to use software nodes

 drivers/mfd/ucb1x00-assabet.c | 88 ++++++++++++++++++++++++++++++++-----------
 drivers/mfd/ucb1x00-core.c    | 12 ++++++
 include/linux/mfd/ucb1x00.h   |  3 ++
 3 files changed, 81 insertions(+), 22 deletions(-)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260705-ucb1x00-assabet-swnode-683cb383d398

Thanks.

-- 
Dmitry

