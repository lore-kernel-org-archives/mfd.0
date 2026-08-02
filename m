Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C686234973;
	Sun,  2 Aug 2026 19:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698469; cv=none; b=M9BQtqgdTQvf6UaXT9oRS0hhqykWmyTZqpX3nAYAclzdOyVDXboeP37qaE+xZrEKT4m0sigoZm4jlCtaVFSI4CatgU5ziAi5GYpI/WlZP7bwbF6XaraK3eGDiKwnI/YfunyDME0g7WcbkM27+svVSf1PsyDTXsGr+v8opItfChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698469; c=relaxed/simple;
	bh=d5OIvz5lVfWFo1pHosWknZKQle6IJGbbz/DgRpDwIls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DS+5gdnDNFYrWkZhOQf208nzqIZHUOl0ZZo4EtQz/uW02NdEzcq29vj2/lLrWPo0wCx+lPFwllzo85v76eA9BkG6lksNH48Yx1VtzifZRGDFuWici3Uqp83k28Z9dN0VZP4d/OfCLC2XUDl9Y4K1d33r8J9hopIqQYZo71f/S/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJo0SSR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJo0SSR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A724F1F000E9;
	Sun,  2 Aug 2026 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785698468;
	bh=d5OIvz5lVfWFo1pHosWknZKQle6IJGbbz/DgRpDwIls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DJo0SSR8HdR4X328GgGb2FZV1mScYhcQ2vjZyRsrn/RGhEbmRbSGwrjDpwwRm03cb
	 /pq6dJ5XTY0r9uEtDwhzQJVdqaN3hua07w4XSS+AhMvuAdK9tOaoTjOLqobM0QVI1k
	 lzDinegPnV+pSgUdylfp14IzdpYRv6vrHeKxY/ZoYha9XZ8EAAGjOrj++5DfjsCeo7
	 +eFh8ZJt+EppvcKuTx+nns2ofn0qMqlIx0zfu7j2BoCVHCpaksdR46g5/jZ9h4ipXQ
	 e83gwx/gJmDd/S+mAxQ87eVUpUkOvrQZJnK5g5SYVxlujiWIGzoozAvcjaEakGb0mD
	 ps5WzzUT/sWLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260803-msm8960-wifi-v4-2-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
 <20260803-msm8960-wifi-v4-2-5ffa27aea39d@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 19:21:07 +0000
Message-Id: <20260802192107.A724F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>=20
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
>=20
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
>=20
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
>=20
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-msm8960-wi=
fi-v4-0-5ffa27aea39d@smankusors.com?part=3D2

