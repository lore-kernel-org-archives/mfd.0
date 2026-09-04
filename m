Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DE3B101D
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528143; cv=none; b=Y3MKDnM2RD68PgNShw9R/nIgD3mZVBmcLtVPYUCyBJ/EY0C2Uxv99uMTab6oGB8XNiE5HvPP9nM6SwOOS1BAuZOP/gbjN63aPcxfOc0wrtx7Nqr3apWZUFWs7bw4aOxIcVpO303j+cxMtHuCvk6/CNRwGoy1ma1HuFe6r1sHPr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528143; c=relaxed/simple;
	bh=j2lwTBSojCPKHOTsC1xehDxj+wEV6/PV2MfUUfxDuFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NcG2bo+V/Vc1dAs4m+n767VfP07MrpYJiiyLu9Nrcx6DlGklUmbdv2qZfehExAA1qmzEhvYyasXF52KooLUhkrrlB43Mf04Kkwca9yaxuY0c2usWfrhrkfWcsnKr/hmF6u4Y1/9ScMD4Z0JUDtYUN2NchbqUpugVPPS79F1hLRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af2VgYDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af2VgYDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071FD1F00A3E;
	Fri,  4 Sep 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528142;
	bh=j2lwTBSojCPKHOTsC1xehDxj+wEV6/PV2MfUUfxDuFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=af2VgYDuzLuSb7xEWw+sHXbgpROJP/76ubIRfZBsaZUgComstjh526vAPUpvXfuZX
	 1/nywcrw2kqonj9eWMMvzGW5Gmb1bAVNtqlg0Zhyta/5PrSkEs96oJdpUdGGuIvKXX
	 Kz1AaaDZB//x1WS+FKwiVrc3txSF7zAh5b8spbwZCFjXz1OjLxdsc3NytOqK+R9mN2
	 ctC3YD5QgHKi1oIFw9fR9RmoLCsZ5UfjUy3JduoCzQwQ0XMdgXNs04lzhAoYx1qDKQ
	 q+jLaRSmRb3p13FFVBfLAtabEPFtqPK8dyOPGq3DNJqtCMAq+gG/YW1BHbYAz3Lv1E
	 LWnAxJ8MzOS/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: cs42l43: Move cancel_work_sync() into remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260904131243.755201-1-ckeepax@opensource.cirrus.com>
References: <20260904131243.755201-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:22:21 +0000
Message-Id: <20260904132222.071FD1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The cs42l43 driver kicks off a work item waiting for the device
> to appear on the SoundWire bus, once the device appears the
> MFD children are added and the clean up is then done through
> devres. As the work is synchronised in from the devres clean
> up this could lead to new devres items being added after the
> clean up has started, if the driver is removed before the work
> has fully completed. The work should be synchronised before any
> devres clean up is started.
>=20
> Fixes: 0f35dc4bd50d ("mfd: cs42l43: Use devres for remove as well")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904131243.7552=
01-1-ckeepax@opensource.cirrus.com?part=3D1

