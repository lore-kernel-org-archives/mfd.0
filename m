Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788695;
	b=0oubIA9oKiMEyhjc21r1zKMu0UmUHyv4M4v4OMSpfCA5ZxJHZJLgwLgRjLDsHt6bD7PB
	 O+Yzt4a6drfaNuYiKj/Y6YhD15zeycSsKSza2GndsSF5CAPEnOF7K9zJ24/cEteE3ikgk
	 4qOuYT59RXgwD1l2r9/WSIvlEEYwbNqCPXBYmCSwNwajihs6+a6CvgquCuyxUjwDYiQP/
	 Njiku91ZcK1CRjBN5CCmhxQLJ45A5RHvan/xGJshqxcHcU9whEFISkiSSbVlVGwyA43c1
	 vrqxfQO3s3M8XGGThVzrt/Shu01xVSf523gn5QzNJKcvBpCvquW8xU7q/h0LjaUtJEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788695;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=Bky+z94GjBhGuHRVzoeUOOEZJsIpZL6CWBksx0pMhcI=;
	b=l8EzHdodok1ocNNMRbTq8GG2GGMbvc0FJduq2+SxCi/M+78A5uXHw7V1DXLyTl3pLZB1
	 ZVCNb+AIUXZYUNuqbcn21zx5O0etyW4E7k2yx3OFYU5ZDnFfCzj3EOpr6y4Ev6LiXzNOk
	 aT/W6pBokyIC2kAWBfGm7ExOYx8YqbkFwhnt4uFk38mCSq54TkHDhOqkRkECQm5uCuSW1
	 YqZMklH9PcI17JqdSZRH2kbfOTojcPBTcZy9HB4i5J+eRLgHwBc778ZEqgEbaiTtPDFlG
	 0Zc/PRf32RjNvV6BNNT/x9l5ZGH6oNGMQcGmK4x5EkqzmsMSQcBVElBAJ6FKyHB5JSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XbHSzHRz;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F02606A328
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 10:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F02606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XbHSzHRz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793788694; x=1825324694;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aOGzTuu2joxxtbxKzL4dHVBDbu15VwOAO4OF8srkPsM=;
  b=XbHSzHRzAm2rnwRHd7vB8V1Qc+88tBsUrSv2zvJOZaBqtc0GHJ71XFU0
   MFhAkmc2lQqrXMpsNSkYshzccff7Sd4ATzjNUOYye0AfI1yLriML2aYlU
   F1FZvjHo64/kmylSNmgWhiQ1x4TqFpFve4jOMghGc5/9XE8SkFAKKF3HA
   l6kBqHLWiowO6GecyGtJdmao9dG+yJgfSJYtXP5jSjQJ6/SpCJEuvdHGg
   udhDO+ugv1OSj4NTdbwcSnURx9K2U/I9plfhmaatqzQmhgecfHxXmhPgJ
   Ffxq1sv0XcQvp+E/0TCAouRR7eoP+bG/Uj9kC1+mjsrMruWGwALpIp3pM
   Q==;
X-CSE-ConnectionGUID: xiopD3daQr60PkkvDbw50A==
X-CSE-MsgGUID: YAZcXyeEQzeojVLn1llUEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2412953"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2412953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:38:13 -0800
X-CSE-ConnectionGUID: +o7S5iu8SKeIiX9Wt7GSfA==
X-CSE-MsgGUID: 8J3dyKC6Q4eTbNPj8Cjt7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6569104"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:38:12 -0800
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	dawid.glazik@linux.intel.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND] dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
Date: Wed,  4 Nov 2026 12:32:06 +0100
Message-ID: <20261104113206.3243865-1-dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add aspeed,ast2600-i3c-global to the syscon binding compatible list to
document the AST2600 I3C global register syscon node, which is already
used in aspeed-g6.dtsi.

Without it, dtbs_check reports this node as failing to match any schema
on every AST2600-based board.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Resend of [1]. It was accepted on the list but is not in upstream.

[1] https://lore.kernel.org/all/41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com/
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca2..dae706ca7642 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -47,6 +47,7 @@ properties:
               - apm,xgene-mcb
               - apm,xgene-rb
               - apm,xgene-scu
+              - aspeed,ast2600-i3c-global
               - atmel,sama5d2-sfrbu
               - atmel,sama5d3-nfc-io
               - atmel,sama5d3-sfrbu

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

