Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792564989;
	b=WpIhzKHuULbIKYobizUAeR63riAMBgkHKqciCdP9dCh/l42T4Z1U3+Kc5pXHM+CMbaeb
	 jjD+hPmEGTPSeBeapmJgeDCBVcmVTbFwF+13rfpLYNC9vbsf4tWVRxvpetFzB6mV+c4GP
	 QBuePW7dpJiUb9/8bAWQGBBfJH8xQlyoFN9QBqKz78TKkTU114DoaYCvW9SvU4dPXf2Hy
	 P8h6w0JsGxfb5AInyVcO0kP9Kzzqxqnfk0n9RgctYTFHRWQb94yJkgVB6ePXI9H7agW5E
	 hkMJRaT1UJOZo4UsijQ78uIVBFeB2VSgbjDNPUYDA1viLxIVDW4/bNRQc4EZYgF0bqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
	b=Sbbqe0RhZtHkIYYVbZiPfXyazVrLhbIiVo0HGOMHeEMBhjvCIIFklRXsoyB2G1TCQQrN
	 ojyP7c8Xgd/Eqiw1Pw6JTdxjBLglKlHu36SCaRV35HMqwa0fnMwM+VG115VewCruPIvZb
	 RJEpH9rBmp0+zPyaikYEM7y5rHMVa0v8VWvbGfxNy19BlbSYHuzA3QYwGOyDcPkq22q0h
	 OZ/ZaWoJ/GzmoMPRAscp+6V/9c8hDIqC8wjWHdOR1/pJjPwmX55pa2m+cYvxVPZ5cILww
	 TtdOArDHG1R7MjeiHYepm3ScNbRnOcSMFqFP7JnQ0cM+lgTThIM1euF0+0kUiDUnAiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cRzSOSRH;
	arc=fail smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18785606A31F
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18785606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cRzSOSRH
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-676804a3a22so313556d50.1
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564988; cv=none;
        d=google.com; s=arc-20260327;
        b=As3q81O+iNhFPZ6lS6JQ033ehfQXBrFsCMTbiftF4P6JWD72TUOfDzMz9WdW1QNaUY
         6MO3JtidP+IzlDnNhMK+eRVi3bKLjXbJo/YyjHTAHXGCoSrAuZsUFMfuOj0O8VdpbZCq
         Ct/RlWZylsf+aRGLrY2AtWeorTqCR9OD1Mx4TntgJHo2EqPhxgdVJDzzUo1i+apabpd5
         JsUw5nngVOkoso7rZ/nTX0oT5L502v9h4Npq8La+3e+djKum4chjwsLcVewPH8ORBiJ5
         ezud0g5YAyl3G0JKH/0ld63ktw4VthNqBBIYXrS2Y0Nl6f1WLwf3jW02OAecS3K2U00y
         FPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        fh=eTuy7pV69AuaQCf07WmIyxozBkpdj+Ov58wE5z4VO8Q=;
        b=kQLQhgMMLHEHwfMNYu5Io3752SjAQKxijURCPsc4G4Hb2jFq3ecxNd9V4OnOyAQTd7
         A3bcAvuaAySM40j7zw0UaisZNSPFE7kCtzTnzT+buuxDb51vqBkZ0lG/uWTy25rozrqT
         MRVR14up7WtyNSjR6Rw5FRKxi8lIMeGFWjSw4WFXekqgzPYxrIa/xsJX4prymWrhQCAU
         6pV515phWeOSCqx86Zd7aBH8pd+AcAXtyB6vCJhv7M4fro12jEMIn+aYRZ1qkgbAIWdQ
         uvyTe5/VkeabU/kggK5UW3lxZOduAN/C+a2JgK9HExIjF9KaSZPNaUmoKwCp4/4XLi9Y
         XO9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564988; x=1793169788; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=cRzSOSRHFN0Ka1LXOU25F0eWIJ9Mgi2OoTGt6HDbcXz13jkcY7yY0u7HVgNkQkJ48k
         UPPTmn9qd7FBnba0ryveJQC1dEMcvAFrAAhjH1S+4Rv2h80Cg2/l3P7nGUji5xpcMHiH
         KCZ+oXC8N361nf7rFaNIX5BgXx+Gg+aySIM55SUjQmISeXLUvc+sKgmdZcakQIylURnm
         rr121Pc+PxsIER70BEpWnCwp3VP56UIwgwEYOwFLy2I9EEO2O7CMp+TJkE7Ddgn+BgMT
         QKMvTyYNNjZGUh5tAF/HewQXhl65kXZXvkXRKQ8JNrebT4BALwOVAqDHa6YBkw+/pxKu
         0leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564988; x=1793169788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75HaQkKBv/s4TtNxkrkKWGdW1y+fNkvn+Rmd7D3S10U=;
        b=k2PJ+TAcQInKw/lylkCKBK6RgPAO8dHgAsePDYgGbDQ3v+4CSgIvFF6Ii1SSCNNFZx
         s/8aoQRl8pg0R8G+M7St6w042nVX297SVrBZij26W49hyofHB89rpACoiVgWupteIdWj
         oFD6ACNYSv2XaCKea4WXX7x3xq3cJAOqRdaz4y1Kr4vnb7/Me/eO/M9Ryq9NiCHXgVC5
         j//Yo97IbYEljGIqhPthWCWrev04107EClXqyLNAK2dNLuYGF4jxyreAAvve5gFrHsg+
         dS++ttY8AiXHBT8KAItwB5ATcjO++84dVyft+/NjMkj6zYFRWfYI+AIfzR7mnJsL+xlS
         EClw==
X-Forwarded-Encrypted: i=1; AKwUvBxgFr+YZq7EnI+6rvIKigEEnFVrQraim2a33Hb6t1Sm+ldLELGuUTIogqTlEYLXKx9k4l8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJcvv8cL1deXOdSL9FWga8ZPVYyiwbd4ltYcpznweRjfbBcjnuz
	y32xrgr7BUbXPF/DM2S/Y4Hk/TMGCQLkGvxajpSMWmWtpnUcudqU4OrmUQJdVUhfvAe8J6yktn6
	9X2VFnUgWL/R/odG3BfYgwGj6rzK7CqA=
X-Gm-Gg: AYBFou0Mbk4xLo6xooZ4hWSwf79vWr45pjyplTnP1ojkIQtqdBphPzokrMjqwTpW5yl
	GMFi1c5jKCYN/WyvFtXSRXKeXJgA7QLVO0QK6p8YCTZB4fl5U8+eYBIc+EUF+hMviL9Jn6Gp+Dv
	bgO1CyWW1KNW12DUaknzuLm/8OOosQiLihpiugF23vt2tAGxpYEYkL9x894bK1PRMEYnrrHz9bw
	3Jv7wSt8XRjFoeKTKOp9fsD0wIvPu5nHd0x+7aBmqFtVOYrChibzPUVp1VF2IIIYhxCA0m6Wvqw
	7TM6+zVS8aiW5ORFQVIWfSVy56penq8GMol7HLYqDF/IxvpoCPNLU8lfS7kYd0K7AYn8gQr9J+X
	XAj6nLXPMdYXuF/b5TeuYK891/XXjVM8hNrc=
X-Received: by 2002:a05:690e:b48:b0:677:db69:cc1a with SMTP id
 956f58d0204a3-67a0e02fb85mr644184d50.7.1792564987934; Tue, 20 Oct 2026
 23:43:07 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
In-Reply-To: <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:42:54 +0200
X-Gm-Features: AclHuK9RBvE_tu1JJML2kndZnV_iY7Vg0PVQd2A9ECqRfA0-uzrQqgVwLULojEo
Message-ID: <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> And here you write clear note about dependency, once you fixed
> bisectability.

Just to confirm, would the same text I put in the cover email be ok:

"Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. Patch 0009
also depends on
patch 0003 because of mt6392-regulator.h."

or did I misunderstand which dependency you are referring to?

Thank you
