Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046741CB20
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186357; cv=none; b=U61DpPGcC+Sw4+lb8JAEWCM5gJfv/hge6eOgIP8lSlvtPk5gop3f+k8l1mBO59F+IzXdzBPWwP7YvsN5dgw9Xal+1Jtukl3JYFOZ8x25rdMTCW8F5FUjn+wOW3RBuyoomdOuEM+YSGcOI7yaNwcSLgcZvAZoVgP3YOqfqoy2eBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186357; c=relaxed/simple;
	bh=xY3kpUC++xwrC9zqItzB988NyIQTLesBk34mFibMs9k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LLo2s647F9eXYlTfStX9pKakefih+4ejrphFdh0RMivOHWQKTM7BenEFhu12FUfRSSV8khYRHWM8hV9YyFRG6/RtrdGOd6psoBH+sdwq/c7DBimkR4lAb2zcjXIhXaqjYAO0OmBGe1B9Og4E0ul3tWI1B66kRStA8jzMR6AEnHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9M+PeG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9M+PeG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E448A1F00A3D;
	Mon, 31 Aug 2026 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788186356;
	bh=xY3kpUC++xwrC9zqItzB988NyIQTLesBk34mFibMs9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N9M+PeG306/7OUmFbpGQ0JfymwguYGLwN9JCh8U++6x9Loz+PjZo/pGW9ytax/S8o
	 zBxs7CNncteFY9vDPvB1yOsnUaR9bPMRqsgDrGwIY7bWVA/CvjzPl1JzQLASSP8OZ+
	 mHMv+e6ync10vA+7sb2tCo1pTRfLXksvK4/g4MZ1WCotn4mHG3giK0hA6vT7cQYX1B
	 8BdtA4xs5aC8WXxR4Sn6/6dzo9RSIxzZdrVjJmfJkR8Cqq2ZBBckF9nz7X4y4tKtIp
	 EXkfnX9zqZ1DYHFJhai8fJmWXWgXnFik37tuJOe+ez9hKXhvL2qXQ0KkE9SEjs2g+E
	 6ztc8rVmexHjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.6] mfd: tps65219: Make poweroff handler
 conditional on system-power-controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260831133314.4125787-125-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-125-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:25:55 +0000
Message-Id: <20260831142555.E448A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Akashdeep Kaur <a-kaur@ti.com>
>=20
> [ Upstream commit 104cd764a031bfe2ffe253adce9581384a78c16e ]
>=20
> Currently, the TPS65219 driver unconditionally registers a poweroff
> handler. This causes issues on systems where a different component
> (such as TF-A firmware) should handle system poweroff instead.
>=20
> Make the poweroff handler registration conditional based on the
> "system-power-controller" device tree property. This follows the
> standard kernel pattern where only the designated power controller
> registers for system poweroff operations.
>=20
> On systems where the property is absent, the PMIC will not register
> a poweroff handler, allowing other poweroff mechanisms to function.
>=20
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> Link: https://patch.msgid.link/20260401112257.1248437-3-a-kaur@ti.com
> Signed-off-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-125-sashal@kernel.org?part=3D1

