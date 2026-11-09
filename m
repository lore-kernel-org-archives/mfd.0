Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217414;
	b=e/LeLD90P4Qazg/nAKuA1FSbyGSpWDiMbx0CTGSwn5uqhaERe/mxU0/NU45hD7fGQzij
	 K1vUF14qd/rxyQa+9dBCX1e8sKiJ24ofMMxzr6KflF6iYHBqW77QU1PwWK9ChhVCPQY57
	 hSh6xmkbfCQvGW20IxTJshAsG9t76sB8iqDh+O0Xg8osXwqS3eOBlW4xLsy2+dIntNON/
	 SmrlS4muGDYEqMEVj2nSZAjX1XI1Ibuv7x7KT850FnJni72OOVTjXJXC8pG7bwrLXvLq1
	 zJvnOgUq121Yf8UKZ0TrRvu7v0mPko71vl7n2jWjKChMR1Flocl9/wFq54UIZzCnlZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217414;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=X3no4rhRBLwR+s1F99TECEwct/nFZ4Xb+FSwo1OAE4M=;
	b=v1xPqxMHoK9cBXIElT8JRBM2iQExmqN5FkH3FeXJ9U+Q5W7ngeAjNM5rSAOwS7xUHYsq
	 1NJV1cZZeIbm6gsCnIXG5MMW8+SjxDWtU6MblU3mEx+5TzsP9bQ0JpdONXf2jQzW/cprO
	 Yq0hd5hK0rtOTe1D93Erag2oJBJdOoDqwMQfnEpxv5klqdDFNrjJiWxc+sQIscWqvhC+s
	 R6cfENW17xkZDYlNfXzPmp9Ywpiod6d4hkeTH2OGnLQcsDPJxDSirPAROC96zeEMFRTY1
	 6NOMrT8oP8jEzD8tpsMXvjTKmk+kOgQ9reuXBb65s4uOhkUBmacafZyY3cQRFTQXFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=Or10fogX;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D2D606A332
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 09:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86D2D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=Or10fogX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794217382;
	bh=X3no4rhRBLwR+s1F99TECEwct/nFZ4Xb+FSwo1OAE4M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Or10fogXCO0pmNftiL0piJuUzesuy9c1Cgp9BSiekQpvLT5f+5Ks9cVwVYgKerfrD
	 ZvLYeAYzsQRUrETMrA69ElISuxq5A0ejDAyIfJhpuRURfiUtSfU5R7p+mv4Xs+ecp2
	 qVzHWol9w35CPzcMg/LVodXr058AeMt48xQhjYs8=
X-QQ-mid: esmtpgz15t1794217364tc6710433
X-QQ-Originating-IP: P0dnXr+JG4T4lzEZSen4qEVvFKsIsadQAKCqDVMiyDE=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 17:42:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12239275079439126609
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: lee@kernel.org
Cc: andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	stable@vger.kernel.org
Subject: [PATCH] mfd: intel-lpss: Clamp latency tolerance to the register value mask
Date: Mon,  9 Nov 2026 17:42:42 +0800
Message-ID: <82545EC5E5ABC9F0+20261109094242.3783672-1-raoxu@uniontech.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MgRO26CFjEybQMBXp1qWv6NdK5NnRWXIQdRB5R0BsRKjsStbbh4o0z3U
	Hz13Hnk60NCRo4GQiVJBptQLcgAZLHOw6gf0GBOXpxvlVxGGdlOgx+M92ywCf8pxK4dHLFd
	jHmIpHfQKs7o19eXtdjk34YatuJ7or4w0aP1fTkXreM9KXhidw5cHtNqL59VtqyZrDRueLG
	ow92OQWllBnHcmYBDQkgg9cOgBtl1lnxD4zc+y3kAKnsIYdm8UYami9dexDHrjGjKEfOcAS
	5UwqDKb3S8M9CWgHuAo7HvacGqfwR/mgL7BbxMhWaU9jij23PtKx0Jjlx+fZIuN0kPC5QBM
	/b4tph6RV9u6CQSbTtFPmSdMP7KUCqn5Mc1rlRnKfrzRBXAA2DYKilixcA9mMfarez3dWP5
	xqyyX2x/9f5xyGD81yrzFofvDphvJF4NQ/hi8s66tvtDhlO5LqdTAzOQMv9+T/4S0QDCE9O
	5kwSSdGmG+BtLfSftEp2icp2SDm1VYTgGFW0Ak+HHJmMD1LNK894djNLmpOR6MDYCOHT9FN
	EDf8obz2TFRfg0moSm7OIskiO0anYwgvDs2WBtc/f5d35OeRWLnsTCY0KWFFTIz+zjLydQ1
	54zVBBrY9YSywAGYiy0ZQLg25YMHpl7meD2nsw0taN2EEKhRS8nJqJC/oraevxGu+tZN+yA
	wuQ2fjDgoohbrvOvgdRVVLdzWHdgeNb/+Uo2xeulTZvNJCNFpGSpBBsqys1aOkiksTlpLjR
	oCT/xeaiKSnC97HNBqYI0/2dnh6Vx1oBlr77H7aii84YbXBehuaD6EFwXn81ItwsUJuyvLa
	NqQAIqTDpmHcIHxgyPV6t0YROGr4rHa1qXKysCvpjur92whN/UHZzf8viJnDhG9B7KTS/Wp
	yGFXnxRSV/nDsgJimzaJu7TkQvcbV2C/liwxL5wmYWf+bMWA5l0Bv+sRu+Dv7wMYoUtiqaX
	g/dnpXKyQgi5cLNyo9JjPyNAyuzQ95MvNBnaI5/TcfMOqCa+pMgNxorzGFWnYR41ZTnaNta
	oon4SVZrFALRBcMNvM4c/yd0cXkbpr0zlLnvUeKeZ4z04UU36CAcJVq3xspYg=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The PM QoS latency tolerance interface accepts non-negative s32 values,
but the LPSS active and idle LTR registers have only a ten-bit value
field. intel_lpss_ltr_set() selects the larger scale for requests above
1023 us and ORs val >> 5 into the register without limiting its width.

For a request of 32768 us, the shifted value is 1024 and the latency
value field becomes zero. A request of 100000 us leaves only 53 in the
value field. Still larger requests can set bits outside both the value
and scale fields. Thus a relaxed latency request can produce a much
stricter tolerance and unnecessarily restrict power saving.

Clamp the shifted value to LPSS_PRIV_LTR_VALUE_MASK before combining it
with LPSS_PRIV_LTR_SCALE_32US. This saturates oversized requests instead
of wrapping the field, matching the Intel LTR handling in sdhci-pci.
Negative values and PM_QOS_LATENCY_ANY retain their existing handling.

The supplied fix was reviewed and this commit message prepared with
OpenCode AI assistance.

Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS devices")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Cc: stable@vger.kernel.org
---
 drivers/mfd/intel-lpss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 29f30ef0da99..3c3e75c23720 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -23,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/mfd/core.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/pm_qos.h>
@@ -179,7 +180,8 @@ static void intel_lpss_ltr_set(struct device *dev, s32 val)
 		ltr &= ~LPSS_PRIV_LTR_VALUE_MASK;

 		if (val > LPSS_PRIV_LTR_VALUE_MASK)
-			ltr |= LPSS_PRIV_LTR_SCALE_32US | val >> 5;
+			ltr |= LPSS_PRIV_LTR_SCALE_32US |
+			       min_t(u32, val >> 5, LPSS_PRIV_LTR_VALUE_MASK);
 		else
 			ltr |= LPSS_PRIV_LTR_SCALE_1US | val;
 	}
--
2.50.1

