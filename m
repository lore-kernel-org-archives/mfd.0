Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40122509F19
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057143; cv=none; b=UxT0EAESQTIcKHa2IqWQalCfvvwZptepA/Vu9TwQ36garn6cdW60up+UBuhGW9JxNWuN0BOqztv7WTk31iNkASDJEd4xe3uyWnu8pHfsiRIyAsjxKKKMM1Lq2WjUMmtvrfxdnJkWMbO42Ll+nnRWtlFkIJHXIglBcrVt2JNMuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057143; c=relaxed/simple;
	bh=vcN/To+R+z1ZS6zNhlS//KsRFPUPJL+OMyrrHecOVk4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d1CVftrvLv7hTIQTHie4CoYYjZ+ODWswR58C9xS/VCmOmBjUI7W1fp7hdqKCKkyUp8y2RTC8I1KQLqCRwaU8aKGkbyw+kNtU7wpLYwshzstaU64XxmwNWMo4rNeZIZrK6TxhleZ+uL4mh1mriLq8FkjeyCZGeWdDIhyqNcR/Kyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVWomUGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVWomUGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF621F000C4;
	Thu, 15 Oct 2026 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057139;
	bh=vcN/To+R+z1ZS6zNhlS//KsRFPUPJL+OMyrrHecOVk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kVWomUGGYwO1x2b3ATq8oFMnyjDWNY0y52VZPJX3wNt6Vnxa5KV1p0s0wNnIvi55y
	 c8MH4h4TBlVjEriA3MmdhoQ4dMAVkhS9QZPNxhcBe7EUodmS+2G0XLqVd3JS/5XEyY
	 1XJLSLe0vyvZSqWrMpyyxrDLsC7fiacMV7/RaPljjhPu28F+wQFT/CL9QPpBBIW8BC
	 eUSHnyUmNrhBo/KpN/U7E6ZHK43kJzCuYaBXiWZ61pk6fLm2fEGfhSVwqtPi6IKU3+
	 x7DJU5TJeykTNr9LiGNn5kLXnmnNXrGyr9A/FVdcmU8S0CR92y1cj3YYd8myg08N6e
	 pQtPd+SQgwlqw==
Message-ID: <sashiko-outbox-172582@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:38:58 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D7

