Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709137;
	b=NqKZpEXdbY1UPL+ac/3MeelcqWOPwET2HfPMsR8GxUu2ZN9agbqFXe1Hf+7PcGKLtDYT
	 LBY7S5YgyXCe3/6e+04rCNiBZPYuuIrW8B1P3Z8tUXLdwOkPWZm2b06lnXFANF2nEMHkB
	 9YNl3tXpXxYG1VHCy7CIpc9AKSox+5AhgaCiEH09YaXrGTG2cBK+ySaOoggmniWwTj8bi
	 FzSjdJLegS+oIJx9xoDu6RXIqDXb68WCnEoNWjIlkNDJiXKXretSvqrWp37dqNBPGUQ3n
	 mj9PIO9c24jcWeXYgD1ZC0YonimbopELzWihp6SNXawaJBOT6t7pwg8XsN8nEDNh/mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
	b=Uopk9yGKtabHFgh18xOGWjN++6yp62JZaCnsD3uGaR3vNAvZE+lDpdTbFik28Cxgto1+
	 +Ixtzku4daXr7rMN+O1hT+oupa1N2VJvywsq3cqfYR9aB43X8o3zRiulu0FSAJXllFJ+Q
	 v6nkdpDC5aJlAUVpUiwBmJarJZ5WyuluZix4yx062GhNUyjGZrgIGcKt9PO3KpUOCYhHH
	 BUDgBmd6Iv/NqZXwMchWgTkzQylK1KTWMCTnFtPeN+SUx/OGUeIYXkZZ4wJ0t+7WnqVOz
	 0jQM8k458EsNPUpMpJpG0kWAd2/32vPJPfkRuPzsHDzE5kYGnbIYKwplpVnHWFMoHvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xSt991oB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC7606A326
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 16:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xSt991oB
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3869f03af6aso6300795eec.1
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 08:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795709136; cv=none;
        d=google.com; s=arc-20260327;
        b=lkBSKkzcxarBJFxnO9ikxa3coCPOvlmVGt2YfPj8PM6hSXRDSrtrDW+kirItKF3Hk0
         zSeUSnI4h8LMdJ/3S7mmWkeDThI95bdO3LsuLxXmg/wFArx8SgxlyJ0BAUoD9ngJGDNy
         MigTWXakXO/zk7QCSTI3xlmvhNi596zsDTm496Ft5DsA2wVXvWnDKZyE/TqkQkLEZHf2
         dv0dXhI582rLJPOOt2ig/0P4r1qaKYrKqstHUJwJ5maV46p1A7EOuuxxZ+HBsfLr0Bxn
         87AYCSNIGZYLJzXA1qXqP80ncwzbygtdIz9c10gtuwPIMfqGyGJV7z5jhj7zyDomvgy4
         fatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        fh=3KU1LLpDO9QCIKh0a9xnSBqfNOkV0gF+db7ScCdH3u8=;
        b=lepFevKPpT2koGsoDF4eCBuDDpP/SB2OQXOkLpHLyi9P7sMqbr6M5i5gojichTG3+l
         vqf5eGuUn8iE4X4ghoH93vHe3ht//hQj7Dsf9Ih5vTT2UaVV9yM15u79GVeFq4nQQyBz
         eJ1eFeN4l5zcU204WkcgRCtuP8oCV/1+3VV+IeKGtJuab3F9dOcpPa0lUXrNdEWYYXjr
         pjyKE0ybgRc0sO48Z4Sij9kwiE0rNZ/HRK5zCQe4mFKGOYeazyHosXKT9tDWrZj92WhZ
         i9wwMmx/16eMkAxZ4r75JyCHNh3FVFwHqsMfgerRjw5Adx0UwcIlLGH9Jo9eyU+xGZnU
         +M6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795709136; x=1796313936; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        b=xSt991oBi4bGqvhdGjzYGKtj/XCbyN2tUG8YxOeNx798Ge7gDtZOUimRDoflnxar/B
         Suj8ISQQ0iDVdpDLXhetxbJLuLdtSZwfV8u+W/CN7ycSWLy+pT4tpAM53G9RMfCEz/P4
         EpRaT28JRSswXtaMAkXJP24qdwEwJkgYE0aLccQlk9WP1a8FNXcwF/PVkBWiMQNwt1lt
         squiqUss4L5iqzSACkNpN9jd6DiI0ljC4sn0aOe7ehHb1CDUegh/eqg1gt//yfCO6srK
         0Dlm0Iz/V6fyVHYKCYt1itTYX1JutaxmN7GLfEKNdGhO6BCN+I6PM0vLQXdW9WUdVLaB
         4vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709136; x=1796313936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        b=maA0sp71dKHrbVerfpJkGLgU1xMOnnZMgsfj041cEJGfizM+sb3sts5yfYkzjS5cm+
         zdtxMb8nisALpL7JnD6Q/FYNGrmHmV8V/c/OszWk3Z9BMjsfHzUl7h4Sypgh6Lk5D9Ie
         ZGuA5mjoooTHAQv2IV24wKTzNnQmeaSU0Iu2VsTCp6DKL4+YLbnZwQ//oHBPU1I2rcaW
         2ufen7DKOmfoWRSmrAhOPGiUlifV96UGw7keUsVhJIfUPjx4G0foAju/dc3nnyjcsj9W
         MiHVJWqxvJ3o45w3T0kdOEzTz0imFLi0MjoWSwFialJlOOeMh+/PO4NqOmVlqdOMixuz
         JzsA==
X-Forwarded-Encrypted: i=1; AL+hErFPmwtwcHKSWr+rj8Y7fYL4ojrHLSWWIqyBf101O8WCENWjkgfNy6pMWuNL/HoEf0QTRHM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/KuoHtwedBSJa5cvlpKZYVoDRejLFOc2cm2jVv1KxrpCSLze67
	FxAM+lKEVmwSJ+62h/5zaANKxwpb6g1oXuWrtl1QHMXuaoAA6gyJ4oVqtboZxBstX9L9O1QhT6i
	uVcF97Un9OhALVksn1WjlAPs5ET+1caI=
X-Gm-Gg: AZFdTZf+wHsov+mO9oJUBLLVOoxPJ7d6iLIWyLxUBnskOHHTR2SIWF4gJ/j3GPutvkM
	/8T9xZqsgbprZVM1ju5LXA+wI/zpYzZ3N1bkhtx3IgV0SHOZ9tQdM+7tQXS6oqXjf/ZUmctm6KT
	cMxd0OGZf35C+eq1wETIPFtCpS/neGlmvVwJLWa3eblkYxTacWKmd9islqy6Yueyrndcc2FAPyy
	qHgT2zZRzYY8LN9bKcNotQueQbcXi7YcUFUxXJ4vXUXf4x173nt052/yIYfDXambAG0h3bk4xQb
	WmZDxPtV6hyotekB8L8PQACtLiaUuo54y3PQxH8uhVvNxtcrDDvaOMIyadBlLs6NR8BiZ4DgMYg
	9rikUh126ey1CsZAYkLg/GUcRKuH3qQOyqP5OQZeopdWo2nw1FweBcDX/KsvfvfVMzopmN9sJdz
	X27Otm4txkJzMcnox9u12AHDAY7COCtA==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id
 5a478bee46e88-384b3986ef2mr24979842eec.6.1795709136002; Thu, 26 Nov 2026
 08:05:36 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123150224.199601-1-clamor95@gmail.com> <20261123150224.199601-2-clamor95@gmail.com>
 <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com> <9a9cac1b-edaa-429e-a5b5-46adba2841ab@sirena.org.uk>
In-Reply-To: <9a9cac1b-edaa-429e-a5b5-46adba2841ab@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 18:05:24 +0200
X-Gm-Features: Aa3M54q_Z-vb7dO5r0L6AcMqg8jjKTFPI9XHDJLIFJzWvQsLcNuaX0nGCAYJczI
Message-ID: <CAPVz0n2-0e6L57FZBwz_azNOq-1Bn6023vke-=KB3a+GmyPjCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:0=
3 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 26, 2026 at 05:52:22PM +0200, Svyatoslav Ryhel wrote:
>
> > This patch is prerequisite for MAX8907 LED patch. Since Lee is quite
> > strict to what he picks maybe you can pick this, LED and ADC[1] device
> > tree patches?
>
> Please send a coherent series that can actually be applied, it's too
> much work to pick random patches out of independent serieses.  In
> general you should try to avoid dependencies on in flight serieses, it
> makes everything much harder to manage.

Ok. This is how work with Lee and mfd usually looks like :(
