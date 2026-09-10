Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D3830FF08;
	Thu, 10 Sep 2026 23:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081698; cv=none; b=PchS9H8VWUtjXTyhZKGePby34jUqNGSUdeYkwfXOgGhAyUt4i9jQDqL23nuT+1tD5BRhMWQf0LcAFqsnSeHVpUMPeESY2JHGwkYruJat7xoU9njxcCHG/1U7oR3T4IckaCB+HhjTZFSSyqFkfy/VAjcRntNBJAnVnrk3rhgAkuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081698; c=relaxed/simple;
	bh=pKeft/QvRKGZenW/+kIyP2/M2mlFDduRYiWdcQQhoyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YPzGuXYzeuqeugxumIaJM3VAhPoj/YXFThQOV/piOGDFo3yA+YM0MoJDXJ4X5QirUHb9YmSPegD6b7ll2VLt54kU3aD9pgtigx7tGWl8xkca3wn52KHNmGD/fsoOOjMVISsDIUcDcGi+DPm9ZnVPW3McN7ba/tA0zJpEHELuZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aueoY60m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aueoY60m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3CA1F000FF;
	Thu, 10 Sep 2026 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081697;
	bh=pKeft/QvRKGZenW/+kIyP2/M2mlFDduRYiWdcQQhoyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aueoY60mhx40fWwxW1u/4lVLGcR0C1xVUXOH0Emu0JQFbNNHIHJrKOqhQwJGfZLBR
	 4hXFS79V3kyMdkXwPyWGzpCn5w9SEVIq5saNDirit2kCilvXpuUkVy89i8M2Ih/mi6
	 a68EoABqQlaBeszqXNkd7Dzld32YPGCFFMmgVAXPVR1H2q73Gwo539AkAxDSNk+PBk
	 jt3WAOiHRNZQ5kznlSgWrfsvbvE7kQHGXMjdbPiSu6GSR0Q1XVfSUnBg1bnV87eLgm
	 BflJF2u0/WHQz2bEuANuFdsr57OlTz7SaJ9aKLhfiNwkftyybUCSs48CuQPhjUaiAa
	 v7I0rcw5Ozb7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] ARM: dts: ux500: Add sound DAI provider cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260911-ux500-simple-sound-v1-5-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-5-6771ac714e82@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:08:16 +0000
Message-Id: <20260910230816.9F3CA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Describe each MSP as a single-DAI provider and the AB8500 codec as a
> two-DAI provider. This allows generic sound cards to reference the
> playback and capture interfaces by phandle.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-ux500-simp=
le-sound-v1-0-6771ac714e82@kernel.org?part=3D5

