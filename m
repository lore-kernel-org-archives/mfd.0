Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29425B08E
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971755; cv=none; b=hIe4hg1p4jgwY4CePRBl7OjREPkxP2wzPczcCK7++GBPklxsBxFoUiTdMTMcN+xJ2rLg1UJU5jJAH6/H6MMfVCDZPmDYh7wkQyJiZNGGyRf4QkyW5arrvXjtwuOkZy+OiXAS+rgI2tdtcMa5ZTFcdgg/BflUVSR+Cws6Z7rAG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971755; c=relaxed/simple;
	bh=UbdpU+cymKQ0s+ZYeMlHBg/imtbV1+DYpkjUVxlq/ks=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tkPO7r69IkQIJ40vFEoud0J7pFZ9tyRmk8Urh+VVOCtxXmSHsoB2WbNQLOjhQUaRj19ebitVdEQD602cFfbf5LNK6HmcisGjNDfzoOwXL2OZZqM6+UWGPnAdI0O8OBCGZfpc19g2aXHrPmdX+fNMsi5TSNqkOI57zzQU9fNicoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbG+tVwm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbG+tVwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355711F00893;
	Wed, 14 Oct 2026 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971754;
	bh=UbdpU+cymKQ0s+ZYeMlHBg/imtbV1+DYpkjUVxlq/ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cbG+tVwmxRJ4ce7rAzLoQqJ994tPDkM0BLx6hXns7uMH+HSkzDcQHQaG0fDRc5tZ9
	 rHkLqOVRy6sFuB6yrQ6mz6/b1XGYu7bdG19qT/aDR44WK44rZe6dCNG7+xVSaZrXgD
	 NAGUPrF3usHPvt3wGdE38iZaoevSJrs5cx1R1FaW9Hwp+acY+mqmRCQa/l/8yhaZqM
	 u0rys5LK1AbBK8oDhWkgzZtTeeXp2YiNDnVZLItJiMCkUHndO1AePO5+RlhZHdY5qA
	 DPo0omqVei7OEBCOIDoaBTUg6q7WqM+qe5xP2ktstAkCt9vsh/nqCtfdIVbGU/LcV0
	 aCHmwhHupXCMg==
Message-ID: <sashiko-outbox-171109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/5] dt-bindings: mfd: Describe the BCM6846 PMC
 complex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-1-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-1-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:55:53 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The third generation Platform Management Controller (PMC3) has
> different subdevices.
>=20
> Identify the parent with Broadcom's "brcm,bca-pmc-3-1" compatible
> for the version 3.1 complex.
>=20
> Describe the complex as a simple-mfd with two system-controller children
> and a bus child, each owning its register resource.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-xg6846b-bc=
mbca-xrdp-reset-v1-0-daf5d177e113@kernel.org?part=3D1

