Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34937B022
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756819; cv=none; b=KQsI/wQr43C7fdcPpA/5bFqCWMhVh5K2iHzoXW0fWu5GE43XcJqmsBcJLJT34VRcS9+7dBXPYfyrDIZZ+rOzJjcKWOx//JZorDHZEds1Q0LRaBkHpXekWtRXIqVJxkeD8M/bSjV1XwbVZFzkMDprZbBuDmod9qcaGQZlC6VgWis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756819; c=relaxed/simple;
	bh=8YkGCsq2fNUJKevjXfKjv5hISCZUB7uMMneD8i3S8eU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/LPGashYWBAnnVPD61Ns+XmRK463ozi0b0p2iQLpS64GwVVTnNXC+JXZrbrvcC36N6W6BJfhUCLh59lNhb/rR9Cy+kplA74evmIA4ilDdn6BaKI1b7AvmmpnrVrLSnyaAu6Zn1pBND1pJwfGGox1cW+3jz9jDLUsIqiegFN3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9txujf+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9txujf+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so3062798a91.0
        for <mfd@lists.linux.dev>; Sun, 06 Sep 2026 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756818; x=1789361618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0T9FLyWk8KyHCUr0Ih+ry7jYQAl4jMXYRsbzP9s4ccU=;
        b=g9txujf+E9M7cLnT7ISmBRSJsYbbWlOgAraUS74OGYXxAYPOejTdyrbcuGbPa0HqNY
         Jx0IpXMvD4sQGR3HWVSJKuvfscMW44jdxdo1piguXtRoo/5i3ETEC1hWo4jEqA2Quojs
         dzwg1Mi5RddY32YONeBv8eiR+aOjijErN5F8WNc8GgEuxszJOguwpSSBFtUM/oyIZRuY
         SOWxhbWhgRkBSqlis46OYC3o+u5M0kt5Lor75DUeFHqN2/piLjxShJrWgcmtKzaNQSCl
         Ye1YKHkS9AzSs09BbgXRJj8EOCsO1/fWL2dMRtm/XpQc26SPaTYPXIHTkB3K6ilI1JKi
         hWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756818; x=1789361618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0T9FLyWk8KyHCUr0Ih+ry7jYQAl4jMXYRsbzP9s4ccU=;
        b=CPRCwx0wovGbroevKQuJmTKq3Vo750tJ/5J71TR10FfVujYtY0zUZpNlwG+GVotfpS
         lvCI3845v+wG7yBd6FZGa3IqiWvfsFXm0yj8NFVeSXhFu4IusfSsVLk8AWWLJ/ZCm/Ay
         3VlAY3l0YTmDndeiZ+2RC1gJDIyZEVrejVnaOD4SgGf6Ihg3UHSwRXiUnLU8/XZgGTN1
         xaafDXNR9CdAovL6rEKDGxic8xz94H4IkYVsgNsxWSj/soli4zkp+MQ6TPNdPNf2oSXt
         TuGIV9O4IKu/lj7WHQxan//8z3YhMctREAN4b1IX9W2ClfFmvnxeMi9+xLkX9c+xEz4b
         nDpw==
X-Forwarded-Encrypted: i=1; AKwUvBwUtNjoJzBUOSgFIRNRq3OtSK1RC9+Kzfg9F4eqSOWeYeMTdOEB3PWNfuZ+Qdp9ZC+zlPY=@lists.linux.dev
X-Gm-Message-State: AFuF++nv8w/R9B990vwI9khGa56Yo541PXFm5Fz7XyebRZM4KH40I0aq
	id3i1rlyBwfk3mNlO+nlq8unoQ8uuSmba59/bYwTXgHtu0WWOnXAhqUe
X-Gm-Gg: AYBFou298TKXQ90wKaplObjZKnoAvdGjtoMCcPlpUl/xMr9QMhaw/ECJga5UMl5qfcd
	+YiSAgEtq+f/UOskWxo/Q2wKavG6jCIO+Dt/r+VoBa7K4NDm5wqd4JHFp4NKIznOgcuFL58sGK4
	n4+Xij0EW8wtUYjCKpmw0HO+lAd2n+0AvJyOc5RXzu369ZM8Lz6T6Wy3+SGA6P/pwg5Zc/3Q9yP
	uUoQ5m/ee53ewgOTq6ALBFN4sCFwiao4mNkfOLDfuA0HHUT77+4v1Ua1u/FZT9jOAITf9APb44w
	n2h8uQGmR1TDVhY5mDAvla2OQ9EsRnNkok5FEWSzzvEL1cC86oqsGhIXOym0Aq41IrpGm6gEdsV
	k2aTZPlUqWHfldP/I9X8+WkcSNFq6L9K92CaVIdvTZ8T8ehpDENSGkEIwDYP8sUkioamVHYOxr+
	pdtBOVjt/3RAxg+LC96Q8Aku6z0Yzsj0D4P14KYwOqNR+3creHWPpp+8LJChexXd4cDMjc0KS9n
	dzmCKuU5Vfj1xJHTV7EP1Br
X-Received: by 2002:a17:90b:35cf:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39b0881d765mr29549079a91.30.1788756817900;
        Sun, 06 Sep 2026 21:53:37 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:37 -0700 (PDT)
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
Subject: [PATCH v2 0/3] cirrus: fix typos in comments
Date: Mon,  7 Sep 2026 10:23:28 +0530
Message-ID: <20260907045331.16932-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
The mfd patch now carries the driver name and a capitalised
description in its subject, to match the subsystem convention.

Only comments change; no code is touched.

 drivers/firmware/cirrus/cs_dsp.c | 2 +-
 drivers/mfd/wm831x-auxadc.c      | 2 +-
 sound/soc/codecs/wm8962.c        | 4 ++--
 sound/soc/codecs/wm8996.c        | 2 +-
 sound/soc/codecs/wm_hubs.c       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

