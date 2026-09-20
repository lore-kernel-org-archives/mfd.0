Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BBD3C3F42
	for <mfd@lists.linux.dev>; Sun, 20 Sep 2026 05:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881487; cv=none; b=bg12PNVkvax/hcjakmqpC3kQl1Ot4FWqBdbzRoa/YNRAZGREdS6GR8BzY2nUNduYffuriZU3RyKRzQri7llu6vZP2O7y9urkycHJClM26LCere8GgBXlb3R464SY/HjsD+4Pt1XG1hZO9FF3MvDcvJPaBCtBdrcQ7mB1G8XRvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881487; c=relaxed/simple;
	bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktzW5brZQ6MtIDx/BDTfSP3i26Pq9ck1BacO97oGczbUDGdqaYpzk3GwKheN2DWMKEgznGmQGjRqPT+UshwdxfA12FBFiCJXMpWLwd7ndujx+/+I0vULsrD7I6pzMxuajvp5WVn+GGDcHlHaLQd2u3SBnon+NC0xx9+ghcBdn8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGGgE2+j; arc=none smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGGgE2+j"
Received: by mail-oi2-f6.google.com with SMTP id 46e09a7af769-8069d92e182so822001a34.0
        for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 22:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789881484; x=1790486284; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=KGGgE2+jJwNzLtzxADKYLY4Z3IM6D0siNzVeDLFz2I1jrLyPfgvQwrjrPN5tbuXbWb
         +qKim3XVq0jSzH+oNk/4dEjS0SqQBUpkySsPCz01vmEZzVFeBjTp7bWBSYs9unofSrZx
         8gXWiUlmH69V0dM4AyIVWOiX94lI/6iX/r8YbSboadQdyQv0EkTgYCYbKfqLojupX7WE
         9UtBZQacrUzSEjhccSDGlWWkuy0yz9pycJqK/jESYE8FdxsAN06ej2JxtbC9qCNOIDTR
         k07yFwW11LKZUQe1HqGmSOxmHNNpUzocT6O2qTy39CLEUkUeU1klk9P1sw11QD2YgqgJ
         S2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881484; x=1790486284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=XranYX8FRXWrsgzVUIY8BedYU/O1XZpbDx/Y6MCJBSmxIYvj4SxzeGTCkLmSHqSnHd
         ENaCDkVbYurxpdctal5d4Rn/oKHEfVSb4swC5jDUnTU0UwSW+f6JNgBQiit6v4LD5tBR
         YHT4Dtmgbd4KvlteHMxD9iVW6PdtuyvgzUAQIq4SPCoAmE4uHSUJJr+XHNPfgMz4AOu+
         1V1aBF5/rItzxb3dsMhdUYki6KfUfXKy6zkPDN0xzy0+Cb1PT9I7qDhPj+kXu7a5xufl
         gG1wt0f8XlyCD0dLcKOHprT6c+A4Pvu+1CaOJiwR2WhidS+tgFPGfb150bopRIocbB5y
         if2g==
X-Forwarded-Encrypted: i=1; AKwUvBx0mGBw9dwXnps1f4cYGJmtFCCZy1u0g12KxAWShmuV8xCPwWdhp0d8zTFbiw88dnGVSns=@lists.linux.dev
X-Gm-Message-State: AFuF++n8/XAvDoChdvJ65HTnO9svwlM99pF74reZLXanO7RV6ezWEpDQ
	bvvkFyKH8n9fiwEWonqlRYZzjq9eaceD2HYncVUVRNeSJmI1Hzwvci/Z
X-Gm-Gg: AYBFou0O7avVGMUO1Ma+agVGeEf+mIrjrf1JJNhCiLLnM6gG3/PP2QKRenfWo4xAW90
	zXg52TdKyQ944MVikPd+J5FLrG5yxpgyPHW8Fo8Eb6HB8MEtUts7IUcn5688czmckdUrnu3UJuS
	QdovoM+JRifhii5FydQFrZDtlKSgD06MQiJp0eG7645Z9+w51Aa8aRAP+clYPnFA9XTyG1KLi1g
	t/i5xioq7z7rYTqzJ/RD0tdB+Og5ng55Mz1jE/tl7iRKAPxl15qrz77VUfgQLf3DiJgxqSRVwO8
	L9ansmaz2OBdPtAB5Y6+p2PSEhG2IL+9wkEwgL00g3n5anh71L8ahilynus5PjjBqytHLvn4esC
	3RVYEtIutQuO87ifkanWtKQ0Fev8wjOrHCzAlVArTGpEAA5NQ744sinlLHjZ1JMDuZUuYd/N2+r
	2IfF4GCQWswKJfA6E+uXofQt+qnT6ji/Lh60qfqxxArfSiZCpXjBKTIAERIQ5twN4MxLqm+IC2G
	vz/InUD/hwqF6E=
X-Received: by 2002:a05:6820:2219:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6ca972e90f2mr6018628eaf.0.1789881484271;
        Sat, 19 Sep 2026 22:18:04 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd320d5c30sm5494232eaf.2.2026.09.19.22.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:18:02 -0700 (PDT)
Message-ID: <1c1b2958-dbcc-4a8f-8d7f-d2eaaebc941b@gmail.com>
Date: Sun, 20 Sep 2026 00:18:00 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 2:18 AM, Andy Shevchenko wrote:
>> Cc'd Luca.
> Instead of this, just put the real Cc: email tag here
> Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Done in v3.

Thank you!

Best regards,
Ryan Brue
