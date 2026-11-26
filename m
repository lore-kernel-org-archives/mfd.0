Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723125;
	b=JEbIKx5RTNbt/TpSMcrsN3I1mbOBdGMG3Fi7u3m3S3NbHT/TdK2D57SgJEL8Ti/fWefs
	 ymJ0UD7R6nwf0d9Bp8MVuNRrbtIqljFUBWqREIHKyrHfegBwcb07VnQo4YoSJ3KAvZ2yK
	 3VUvbHeJU8Zllw7haDzxfnfUmm+6Sd/tZCFyiE4llKhErEo2lbqL3K0ZctKko5MkIZVud
	 7O9WgK5MA3Dv6LnITuTfEUG7f4UzRj8Gkqzw+tnyqWn4JCkNAK1fjKbPoPdBin+9DEz/s
	 PzDuLdSZpc0gNEiJGnwK59uGX9jqL0xUlTRRXGOWmI6JudpVcaXy4wL1WXB2pLiHFMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723125;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=i/6gOHnqlueNYB5fu/W27Tex6Z8oas7OOH4bMJKkmDY=;
	b=gLNhOHrV/rExupvzyc63Bbg8OGelqFBQ6wrj+nYyB2UHtrJCsy3JipfcZINu7dVFVQCj
	 /xdvLlBcWflE9peJvF3zEwiU1e/QdtkmWZrOEgiyaScOWci/9716HKz5w6MM21Jfnzlpy
	 U6/E83pMaMEXBxKaj87yyAMvhwqfGNdnG+058nGP66UJcOEGqBrj4yNJrO/aVDxVppwS3
	 hy2my456HiUktBqvBBi3zKDw8h4M9RVXD/gQq9oMP9GYaSRIPc2v0bGW60TSEc/RAucCW
	 fS08monINVh7gglAYeJm3zjDcmSyz+T9gwTI+Spw9iLlwzcg7rsqBVELIsfFdBIFgiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e08ooBS8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5608C606A31C;
	Thu, 26 Nov 2026 19:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e08ooBS8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FCD1F000C0;
	Thu, 26 Nov 2026 19:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795723124;
	bh=i/6gOHnqlueNYB5fu/W27Tex6Z8oas7OOH4bMJKkmDY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=e08ooBS8xaLj2qlUqy1VgttZ9+3sXHgEY61IgBTokwiT3QL2PkTCC0gheP8ss7woP
	 vUG6218m3kfSY+sChYWTmsYs24V5fsq2sXMVL/wfdIY8Frf1LD5ONEj3UAD4lI+io6
	 Ejylf8nzTuYsE2HOnpofewi+O7saJwKcvbtEKnja2iedJBC21oXmYhMO4Kjwn1uTCt
	 8rOwDJ916OyQX7dPfsDLK9jHTtS+eqm4MW6n15SitYgwxojesCLzjBA2qSGkV18pY/
	 07+6/XoDhvd9EZ/6j1ydEc/pvj7JsAzXEQmmreyBu50OltzozTTXBmwJYtNlG4orKb
	 Io/xo/pVJ19Wg==
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/7] regulator: pm8008: Add PM8010 support
From: Mark Brown <broonie@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dhruvin Rajpura <drajpura@qti.qualcomm.com>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Oleg Keri <okerixx@gmail.com>, 
 Burke Cates <burke.cates@gmail.com>, Christian Cortner <ccortner@gmail.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-2-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-2-5626ba17c0fb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:58:38 +0000
Message-Id: <179572311831.838304.7206356885620187961.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=824; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bM9lYKxU3MNpvhFuKEB+4OieQVeqDPG/3wBR9qLLGsA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5+vN19uWuCmec1J0/kfnsUm+Bd4qht0++PnkwmHc+6
 9U/TNZrO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR5kUMv5g2S2ge3V6YkHrG
 JrYpYNGiB/pXObh/PGleXJHbalaupcbwT11Qtn/3lckGzz5ltXDofuN93TRN4cedWo+PbWotkuZ
 e7AA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> PM8010 is effectively the next generation of PM8008.
> 
> Like PM8008, PM8010 also has 7 LDOs under it which are used to power
> camera sensors. The PM8010 LDO are of different types from the PM8008
> ones and have different voltage dropout values. PM8010 LDOs do not have
> a voltage step rate configuration register.
> 
> Add the necessary changes to support PM8010 LDOs.

> @@ -145,18 +190,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>  		desc->owner = THIS_MODULE;
>  
>  		desc->linear_ranges = data->voltage_range;
> -		desc->n_linear_ranges = 1;
> -		desc->uV_step = desc->linear_ranges[0].step;

I'm not seeing this uV_step configuration replaced anywere, don't we
need it for PM8008 which still uses regulator_get_linear_step()?

-- 
Mark Brown <broonie@kernel.org>
