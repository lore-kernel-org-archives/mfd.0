Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D835E955;
	Fri, 31 Jul 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491445; cv=none; b=psRk9LRLyBmj/e0LmfC9A2BEJ+aDF3tTBgNIWp0qJcMEAekczHo/Dl4qa0C5wfTU4UBb66jI25Qci7Bhpnz+Zfkt0eDetkGwh32w84miVQZYBE2EhVvnJcAK1sCZKAlrliuGYKYvdgjn8wuqLgdTkVoPW6CGuuY/ADDCsOJ4mZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491445; c=relaxed/simple;
	bh=WvgmwxhPZxI/WcFXpOyAmL23IkI64+06Ayiqh/qZ45o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Id8EH1DclFQPzUqK5lh0+L/zWrbiuKiTpVwxz6mn/SgUdgsfQQ1L3yFvlmn7/GmrVjPk2xqvP2vhGcWPRtXUPUtiRjd5hYncsQidg/++sz5nOnIOJQkOeCoH0ZWWlMqDcKlSZK76Lr29fc1f6+kWqn2onAPaZSDo3MXaXFXN9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAgnpFV2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAgnpFV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9001F000E9;
	Fri, 31 Jul 2026 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491444;
	bh=WvgmwxhPZxI/WcFXpOyAmL23IkI64+06Ayiqh/qZ45o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nAgnpFV2AkhE2XQgg8UaXyGfc3b5BSIjxKvPRLBsbef9TZbyBYfZPiuM5UVl0SpP1
	 z6JokPVidNyXUYtk5dSGwo7Ksu3kEXcx2ytiK/5b/XX3q/4RsxUMo5f04ohjKO1BXS
	 MHrEDiVhW8glmWldc0s5iR/Os7xavP2sJLuesXwFaVXQKr74CsXj/XnsJF9oM7zrJ7
	 2Bl0kGlcklb+4A0CdIALgAAmFJWUMsZbJfC3JFKu3bCVMcwJGRZ74tj8eFIJGuw6JC
	 h1U/7+LYp3UAxXw1ndFyoCkjv6tnq/7B4+hOw1GQF6EMIo5DPMCHFi3mFpfZ4cBepA
	 DvMPuoeso5KYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] thermal/drivers/loongson2: Move thermal_ops to
 chip_data for SoC scalability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <d2305c5bf895ac1ad4990947269a6c1b69440662.1785480242.git.zhoubinbin@loongson.cn>
References: <cover.1785480242.git.zhoubinbin@loongson.cn>
 <d2305c5bf895ac1ad4990947269a6c1b69440662.1785480242.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:50:43 +0000
Message-Id: <20260731095043.DB9001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> In preparation for supporting additional Loongson SoCs, relocate the
> thermal zone device operations pointer (thermal_ops) from the probe
> routine to the per-SoC chip_data structure. This eliminates the need
> to add conditional branches in probe() when a new SoC is introduced;
> instead, the appropriate ops can be statically assigned in the match
> data.
>=20
> No functional change intended.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785480242.gi=
t.zhoubinbin@loongson.cn?part=3D2

