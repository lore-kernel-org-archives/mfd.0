Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2491F0E34
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263706; cv=none; b=e7znzmG/MPw7ye+mqTZHSPxqPa0VI2JNKfEm3jual2xMTjd8yPv5avU3d1Z2MlpZbXBe+mfkMp/U5y2f9BKh7/Glngc2opsZ8rqjKKoZ6UnPOZ1tJ7YiTk048IVKovg62kqJG46yqrVRgElCMvTfMsmuUBdyX5jqBFlYTEaHuWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263706; c=relaxed/simple;
	bh=5rXii+W2a2DpCI3ErP/vBEDl4+nS/OXNfbv0P+o1N9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rvlDZNEdxePQKD4q2kjr7qRoJohnogo0sIMP+tIr9l88sKnUqy+PJZom053SjfOBt9SuqulBLhuUBBuONiPTQmNuDpzj2wFCtLKx7fi7gjNtqrzV4zxxj/usbE4H/fNzn/WfkpzPjcDcLXGWO2/sDLBatpmcyygWXPvzd8FGUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQlrSxq4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQlrSxq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1D21F000FF;
	Sun, 13 Sep 2026 01:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789263704;
	bh=5rXii+W2a2DpCI3ErP/vBEDl4+nS/OXNfbv0P+o1N9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YQlrSxq458yAHdUvwxfiYUDf6oR5ZydYlP69xtB7Xz5uNgXe8LdkJE/xVkw1lwL9n
	 zAwjysI/VSIbESNfP/0R7bqewhi1QtnilvUg8nsnU+M9uyEot4GBv11932e7woxpZ0
	 dIg6JPjKokAvHIO8s53NXZDfscggEJvMRQ2eOen9rkOKlKrBdmtP7vVHWz3Kxssu6g
	 8FUJQwjMI4IGwCGig3bG6pJztju3Htz8IwkDej+KHtathdvQnMty6L/5ELhY52rxrz
	 oE0q3B98WVRRdxGEJk+X87exSXVTCDye6hddHYc0V3wdiBL7dfDSf9IwFm+4z1MmJO
	 FM49kb0lV90fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: intel_soc_pmic_crc: balance IRQ wake enable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260913013615.22615-1-mhun512@gmail.com>
References: <20260913013615.22615-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 01:41:44 +0000
Message-Id: <20260913014144.6A1D21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.
--

commit 1d76dffa1adc4e20f1503c7cc9b8a6f0608c2bfb
Author: Myeonghun Pak <mhun512@gmail.com>

mfd: intel_soc_pmic_crc: balance IRQ wake enable

This commit balances IRQ wake enabling for the INT33FD Crystal Cove driver.
It registers a managed action to disable the wake source only after a
successful call to enable_irq_wake(), ensuring proper teardown upon failure
or device removal.

> mfd: intel_soc_pmic_crc: balance IRQ wake enable

[Severity: Low]
This isn't a bug, but does the commit message description need to be
capitalized to follow MFD subsystem naming conventions? The guidelines
specify always capitalizing the description after the subsystem prefix for
MFD, such as "mfd: intel_soc_pmic_crc: Balance IRQ wake enable".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913013615.2261=
5-1-mhun512@gmail.com?part=3D1
