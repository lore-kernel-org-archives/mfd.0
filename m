Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB663E3C5A;
	Sat, 26 Sep 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426891; cv=none; b=mW7ReA/LbIh6SkGyw0eZzGSGPqZHxWXZFWq0gRFn7DeJ/oeIbwM6rox3jMpGKx3aWSlB7JTVRcXdQJ3AYzn/ScEvalSxVUXoejTvZUMUwfhL7aNRo7i0xbxAVwxxwRdUO07wTdrM7nvuTRvVWpxsg9+Ltl1DviQR62WYBaKPR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426891; c=relaxed/simple;
	bh=CfrNiPag1RfAb/npiHQvzmLqP8v6DJr+S5km0Xf6IDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lQTJ9YeAihdbBgmXIhnqQU4Z3dPoQgQDwECRltjpwbLXcVZ/kZZvOQ7LHlA7qkISW+bjD7Zf+2P44m3WV1XjMngKtE4zFhWdLYl+ymr89wUPFMale9F5Hnh704Jx5v+wBqtk7jRVuHG/4B4A7YCNRdBVv2CfVKEduTk0yo8HMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilMz7KjD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilMz7KjD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9AB1F000FF;
	Sat, 26 Sep 2026 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426890;
	bh=CfrNiPag1RfAb/npiHQvzmLqP8v6DJr+S5km0Xf6IDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilMz7KjDGOgpLWSMcHV3LZy3NtIO1BMISzs2VILCjGr6IHayjnX+YgdqgkijkN1fe
	 ntyrnu6T/40sDJvNRU+54ENjsffeFNla4eMtI17S+8XPKNXv+/9dNg1N0nlAnIL09j
	 3865NhZoqORyaL0wgkklgSpomADukSjIeL6phufDCamJunAlGo/qQkLuq78I3oRgn1
	 /IC8tEsD4hSL0ic+0K7I99k5Yvgzla54D8uYXHFCjnLz3Pa/3qSjMkmBlyFzgKxS0H
	 3jmVBIfcCUAIbjy3tJ30YcH/7bfxP3PQW5pr4+3UTZvL6BtjLFLH4yLYjkvzUkJR05
	 jTzEGXIx47yUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 05/12] usb: typec: qcom: Make typec_port accept also
 different structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:48:09 +0000
Message-Id: <20260926124809.EB9AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> This is needed by followup commit introducing 1st gen of type-c support.
>=20
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D5

