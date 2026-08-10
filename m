Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C83EDE68
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371214; cv=none; b=eXl0uHViyZkwD+6ysT+2c7kvQ4Yr+HUB2jPW8hiCHLhboJ7QPna6NhMae+eBdzFaUvIIrEmkDm5nw/SFLCwdSRVXxFb4J/tS8a9rMgJIXL5YK0YG3HuAFx3/0FZPX2xPxx7rNY+cPQrZ70F6drmsbiJ+pHg63Rvax8l1sds64oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371214; c=relaxed/simple;
	bh=bJp0ggenzXStyU+8QHZLkW79pLTvWXs+35VWQ2OzKuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dXd3ARdTYCxdRvZ5kxaw/se01lA6VU8lqgfdLNvGvc05oMJ1iAXNkXu7U6Nweab7A9+JdwQys6tLfKoDRWrkzj4w9f3wTA4jQtXubgp+1nEikNUBZh8szcBxSbjh+1TQzXf4/FXMNsVlxsbltpoiq0038I1FUCTCcVaN3Svbbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bk6122XG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bk6122XG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE7C1F000E9;
	Mon, 10 Aug 2026 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786371213;
	bh=bJp0ggenzXStyU+8QHZLkW79pLTvWXs+35VWQ2OzKuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bk6122XGuHTm35JSNKIzmmjzfnS5QM3IsSFD2jklZZUGIVGTRhwblfYJXilXjS6BA
	 R49taLg+OiXIYsc6N9tgESDR4fD0tVfhfEtOP7R+pBBLnoE7uUdE+j+qF0mt8gy2iH
	 584Xowpyc/Qs+UZE++P73pGpPlmt4nW5DaTsKPaoDTtIgumyeWY98vsx1dMjhZNOso
	 t9o53LQqdTfVcc52Tw3ZIpmCjqURUD18tvHqcNRQiNC5mE5+mG6YCkY3HeAly8pavk
	 b+Wtvnn9Gs/25DPWr505FTQN994dQhQR0Wa5e4DBH8LYwVW/K7bdhy2tPVmSia59Uj
	 j3zip4zPX03WA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 6/8] gpiolib: add gpio_device_get_fwnode() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-ls2kbmc-mod-v8-6-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-6-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:13:32 +0000
Message-Id: <20260810141333.3EE7C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Miao Wang <shankerwangmiao@gmail.com>
>=20
> Add a helper function to retrieve the fwnode associated with a
> struct gpio_device. This is useful for drivers that need to access the
> fwnode of a GPIO device for various purposes, such as creating software
> nodes or handling GPIOs in a platform-specific manner.
>=20
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D6

