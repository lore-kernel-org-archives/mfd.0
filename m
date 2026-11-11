Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399177;
	b=QQBF2jUDG5ir4MPrLHNkTE9UVvzZa6Ygp/ew0Z6j+/mXTi+g/Q23mR9L5L0aq3SE+rJ0
	 mGa69QtO+Dgewlal3E9Y0wqqDSLpmeuFEICQKp7FPv7lnR+9kcWYpRqVfm0QFpPoCWy4z
	 t78jwFkAtmdTLd3W9o+m2fyd4ZRalJWkyue5GxHGa5byMlszV1aThGn3E6FSR0VWosAR6
	 0ux73fsrkw5XTB6P8Ws2rhZDHVpbDLvR6mc3Wwu7Kxqdj5i/W9LCRewpDrMUkmJSnYIlG
	 vCaEc2k//QpxCLWs2OABbdhsLZtq5Fd0ifemaQjpzaHQt+MGM8Zu7AaftAZULk9zeYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399177;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kt+qGRZuMNV8Gjj810OSEd0K8uYaToZpX1WjOsPC2lY=;
	b=Hot5A73AjK9ihZs3kAts8J6KfzreiVAykOuk7kuG+zwlkJOGANmfCeb5bR33WGNM1Va7
	 2eQ2Yv6mdRHThiLfe8ude9pPT9JqHDwgvdgW/ijIPkvv0dzLCZk0371iB6oB0V5zdVLWL
	 K5z3mg0LrrRIcYWOeoI4JrKK0bpg0tJGrMcr3J+jlsN6bj49xdEuN0Wwe1USFS3O0LVzV
	 tnDkGKy/whFDsgMcHYXZC2HUFHM1Qn68aOWVFI0lAtvkGLouERApc+w5d8hcr4ZgmA6vs
	 JtDcCCggkPhJRDHalOXd33iDW5RYYf0w81RkyrnsYULQ0+Td/zY+OdJFvLJ0AOvyTGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S+ohilu0;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75B5606A880
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75B5606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S+ohilu0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794399171; x=1825935171;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VM3xgno0sTvOvRdM17P7nqjZGLF98rSWqjNHx2oRQqw=;
  b=S+ohilu0RqVWYZnX7BzQEOA4kDbwjuK8TsXv+j/y32Zo9HhHtA88fBCv
   ai0B0phiysScK0enM3PsNdnBukpdzm+qOzM+qNeUORYnEcknKK+RiC1/t
   3hdiQcZSTYst/0sF6Ue8FGYfIsSZnA6xmaiLbP/WYJzGvEeCDelh7NyrA
   ZXF5VxMxEdAu/XYqFfaSKQx/vB9QD9IErXJsSGvFRYNwQAVIV6HeRYJg/
   opYvfRBE+V/qeiT8e0BFVnl8Mcf8DWVLl089IG/uW9XiZxkYXsc8rhlAU
   TknoAtvTbYr1OPAZI8cWU/WFDc2U5uOhjJjrEs9NoMS8uzL0SwjdqqKKt
   Q==;
X-CSE-ConnectionGUID: G1TyTK5VQRaiOVYJbVhqPQ==
X-CSE-MsgGUID: mktyPijkSzWrgNtfcyE8Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3040818"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3040818"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:12:50 -0800
X-CSE-ConnectionGUID: hTxaJ46nT5KMO8aN6VQ2Dg==
X-CSE-MsgGUID: VlVRqoU8T5W808a2d8Qr/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8268629"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2026 04:12:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AF72299; Wed, 11 Nov 2026 13:12:47 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	mfd@lists.linux.dev,
	Zha Qipeng <qipeng.zha@intel.com>
Subject: [PATCH] MAINTAINERS: Remove me as maintainer of Intel Broxton PMC driver
Date: Wed, 11 Nov 2026 13:12:47 +0100
Message-ID: <20261111121247.1292584-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

My @linux.intel.com address will bounce soon so remove me as maintainer
of this driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..b5f7aafddd22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13314,7 +13314,6 @@ S:	Orphan
 F:	drivers/platform/x86/intel/int1092/
 
 INTEL BROXTON PMC DRIVER
-M:	Mika Westerberg <mika.westerberg@linux.intel.com>
 M:	Zha Qipeng <qipeng.zha@intel.com>
 S:	Maintained
 F:	drivers/mfd/intel_pmc_bxt.c
-- 
2.50.1

